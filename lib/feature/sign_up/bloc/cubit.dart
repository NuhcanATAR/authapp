import 'dart:convert';

import 'package:authapp/feature/sign_up/bloc/event.dart';
import 'package:authapp/feature/sign_up/bloc/state.dart';
import 'package:authapp/product/core/service/api.dart';
import 'package:authapp/product/core/service/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpRequested>(signUpRequested);
  }

  Future<void> signUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      final response = await http.post(
        EndPoints.uriParse(EndPoints.signUpEndPoint),
        headers: ApiService.headers,
        body: json.encode(
          {
            'email': event.email,
            'password': event.password,
          },
        ),
      );

      if (response.statusCode == 201) {
        emit(SignUpSuccess());
      } else {
        final errorMessage =
            json.decode(response.body)['error'] ?? 'An unknown error occurred';
        emit(SignUpError(errorMessage));
      }
    } catch (error) {
      emit(SignUpError(error.toString()));
    }
  }
}
