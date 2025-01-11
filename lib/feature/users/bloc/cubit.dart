import 'dart:convert';

import 'package:authapp/feature/users/bloc/event.dart';
import 'package:authapp/feature/users/bloc/state.dart';
import 'package:authapp/product/core/service/end_points.dart';
import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersLoadRequested>(_onUsersLoadRequested);
  }

  Future<void> _onUsersLoadRequested(
    UsersLoadRequested event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoading());

    final response = await http.get(
      EndPoints.uriParse(EndPoints.allUsersEndPoint),
      headers: {
        'Authorization': 'Bearer ${event.authToken}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      final users = userJson
          .map((user) => UserModel.fromJson(user as Map<String, dynamic>))
          .toList();

      emit(
        UsersLoadedState(
          users,
        ),
      );
    } else {
      emit(UsersError('Kullanıcılar alınamadı'));
    }
  }
}
