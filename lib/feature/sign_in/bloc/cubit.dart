import 'dart:convert';

import 'package:authapp/feature/sign_in/bloc/event.dart';
import 'package:authapp/feature/sign_in/bloc/state.dart';
import 'package:authapp/product/core/base/helper/shared_keys.dart';
import 'package:authapp/product/core/base/helper/shared_service.dart';
import 'package:authapp/product/core/service/api.dart';
import 'package:authapp/product/core/service/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final prefService = PrefService();

  SignInBloc() : super(SignInInitial()) {
    on<RememberMeControlEvent>(onRememberMeControl);
    on<SignInRequested>(onSignInRequested);
  }

  Future<void> onRememberMeControl(
    RememberMeControlEvent event,
    Emitter<SignInState> emit,
  ) async {
    final bool isRememberMe =
        await prefService.getBool(SharedKeys.rememberMe) ?? false;

    if (isRememberMe) {
      emit(SignInSuccess(token: ''));
    } else {
      emit(SignInFailure(errorMessage: ''));
    }
  }

  Future<void> onSignInRequested(
    SignInRequested event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInInProgress());

    try {
      final response = await http.post(
        EndPoints.uriParse(EndPoints.signInEndPoint),
        headers: ApiService.headers,
        body: json.encode({
          'email': event.email,
          'password': event.password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];

        await prefService.setBool(
          SharedKeys.rememberMe,
          true,
        );
        await prefService.saveString(
          SharedKeys.token,
          token,
        );

        emit(SignInSuccess(token: token));
      } else {
        emit(SignInFailure(errorMessage: json.decode(response.body)['error']));
      }
    } catch (error) {
      emit(
        SignInFailure(
          errorMessage: 'An error has occurred. Please try again. $error',
        ),
      );
    }
  }
}
