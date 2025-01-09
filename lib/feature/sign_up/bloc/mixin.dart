import 'package:authapp/feature/sign_in/sign_in_view.dart';
import 'package:authapp/feature/sign_up/bloc/state.dart';
import 'package:authapp/product/core/base/helper/logger_package.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/core/base/helper/show_dialogs.dart';
import 'package:flutter/material.dart';

mixin SignUpMixin {
  final printLogger = CustomLoggerPrint();
  void signUpListenerBloc(BuildContext context, SignUpState state) {
    switch (state.runtimeType) {
      case SignUpSuccess:
        CodeNoahNavigatorRouter.push(
          context,
          const SignInView(),
        );
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: 'Account created successfully!',
        );
      case SignUpError:
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'E-mail address already registered!',
        );
        break;
      default:
        printLogger.printInfoLog('Missing Case Available');
    }
  }
}
