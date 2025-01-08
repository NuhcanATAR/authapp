import 'dart:convert';

import 'package:authapp/feature/sign_in/bloc/event.dart';
import 'package:authapp/feature/sign_in/bloc/state.dart';
import 'package:authapp/product/core/base/helper/shared_keys.dart';
import 'package:authapp/product/core/base/helper/shared_service.dart';
import 'package:authapp/product/core/service/api.dart';
import 'package:authapp/product/core/service/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final prefService = PrefService();

  LoginBloc() : super(LoginInitial()) {
    on<RememberMeControlEvent>(_onRememberMeControl);
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onRememberMeControl(
    RememberMeControlEvent event,
    Emitter<LoginState> emit,
  ) async {
    final bool isRememberMe =
        await prefService.getBool(SharedKeys.rememberMe) ?? false;

    if (isRememberMe) {
      emit(LoginSuccess(token: ''));
    } else {
      emit(LoginFailure(errorMessage: ''));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginInProgress());

    try {
      final response = await http.post(
        EndPoints.postLogin(),
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

        emit(LoginSuccess(token: token));
      } else {
        emit(LoginFailure(errorMessage: json.decode(response.body)['error']));
      }
    } catch (error) {
      emit(
        LoginFailure(
          errorMessage: 'Bir hata oluştu. Lütfen tekrar deneyin. $error',
        ),
      );
    }
  }
}
