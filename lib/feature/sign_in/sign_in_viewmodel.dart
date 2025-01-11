import 'package:authapp/feature/sign_in/bloc/cubit.dart';
import 'package:authapp/feature/sign_in/bloc/event.dart';
import 'package:authapp/feature/sign_in/bloc/mixin.dart';
import 'package:authapp/feature/sign_in/sign_in_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignInViewModel extends BaseState<SignInView> with SignInMixin {
  final formSignInKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SignInBloc>().add(RememberMeControlEvent(context: context));
  }

  void signIn() {
    if (formSignInKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      context.read<SignInBloc>().add(
            SignInRequested(
              email: email,
              password: password,
            ),
          );
    }
  }
}
