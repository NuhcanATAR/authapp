import 'package:authapp/feature/sign_up/bloc/cubit.dart';
import 'package:authapp/feature/sign_up/bloc/event.dart';
import 'package:authapp/feature/sign_up/bloc/mixin.dart';
import 'package:authapp/feature/sign_up/sign_up_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignUpViewmodel extends BaseState<SignUpView> with SignUpMixin {
  final formSignUpKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() {
    if (formSignUpKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      context.read<SignUpBloc>().add(
            SignUpRequested(
              email: email,
              password: password,
            ),
          );
    }
  }
}
