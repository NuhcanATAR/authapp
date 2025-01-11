import 'dart:convert';

import 'package:authapp/feature/profile_edit/bloc/event.dart';
import 'package:authapp/feature/profile_edit/bloc/state.dart';
import 'package:authapp/product/core/base/helper/shared_keys.dart';
import 'package:authapp/product/core/base/helper/shared_service.dart';
import 'package:authapp/product/core/service/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProfileBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final prefService = PrefService();

  ProfileBloc() : super(ProfileEditInitialState()) {
    on<ProfileEvent>(profileEdit);
  }

  Future<void> profileEdit(
    ProfileEvent event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(ProfileEditLoadingState());

    final String authToken =
        await prefService.getString(SharedKeys.token) ?? '';
    final response = await http.put(
      EndPoints.uriParse(EndPoints.profileEndPoint),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': event.name,
        'surname': event.surname,
        'bio': event.bio,
      }),
    );

    if (response.statusCode == 200) {
      emit(ProfileEditSuccessState('Profile Update Successful'));
    } else {
      emit(ProfileEditErrorState('Profile Update Failed'));
    }
  }
}
