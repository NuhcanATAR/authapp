import 'package:authapp/feature/home/home_view.dart';
import 'package:authapp/feature/sign_in/bloc/state.dart';
import 'package:authapp/product/core/base/helper/logger_package.dart';
import 'package:flutter/material.dart';

import '../../../product/core/base/helper/navigator_router.dart';

mixin SignInMixin {
  final printLogger = CustomLoggerPrint();

  void signInListenerBloc(BuildContext context, SignInState state) {
    switch (state.runtimeType) {
      case SignInSuccess:
        CodeNoahNavigatorRouter.pushAndRemoveUntil(
          context,
          const HomeView(),
        );
        break;
      default:
        printLogger.printInfoLog('Missing Case Available');
    }
  }
}
