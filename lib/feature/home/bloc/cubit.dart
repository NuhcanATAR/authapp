import 'dart:convert';

import 'package:authapp/feature/home/bloc/event.dart';
import 'package:authapp/feature/home/bloc/state.dart';
import 'package:authapp/product/core/service/end_points.dart';
import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeUserEvent>(onUserGet);
  }

  Future<void> onUserGet(
    HomeUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final response = await http.get(
        EndPoints.uriParse(EndPoints.profileEndPoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${event.token}',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userModel = UserModel.fromJson(data);

        emit(HomeLoaded(userModel));
      } else {
        emit(HomeError(
            'An unexpected error occurred. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(HomeError('An error occurred: $e'));
    }
  }
}
