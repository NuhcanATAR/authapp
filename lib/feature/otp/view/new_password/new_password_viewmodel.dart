import 'package:authapp/feature/otp/view/new_password/new_password_view.dart';
import 'package:authapp/feature/sign_in/sign_in_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/core/base/helper/show_dialogs.dart';
import 'package:flutter/material.dart';

abstract class NewPasswordViewModel extends BaseState<NewPasswordView> {
  final formNewPasswordKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repeadPasswordController = TextEditingController();

  void onPasswordChanged() {
    final String password = passwordController.text;
    final String repeadPassword = repeadPasswordController.text;

    if (password == repeadPassword &&
        password.isNotEmpty &&
        repeadPassword.isNotEmpty) {
      CodeNoahDialogs(context).showFlush(
        type: SnackType.success,
        message: 'Your password has been successfully changed, you can log in.',
      );
      Future.delayed(
          const Duration(
            seconds: 3,
          ), () {
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          const SignInView(),
        );
      });
    } else {
      CodeNoahDialogs(context).showFlush(
        type: SnackType.error,
        message: 'Your password has been successfully changed, you can log in.',
      );
    }
  }
}
