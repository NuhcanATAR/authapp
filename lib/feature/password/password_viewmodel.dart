import 'package:authapp/feature/otp/otp_view.dart';
import 'package:authapp/feature/password/password_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:flutter/material.dart';

abstract class PasswordViewModel extends BaseState<PasswordView> {
  final formPasswordKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  void sendCode() {
    if (formPasswordKey.currentState!.validate()) {
      CodeNoahNavigatorRouter.pushAndRemoveUntil(
        context,
        const OtpView(),
      );
    }
  }
}
