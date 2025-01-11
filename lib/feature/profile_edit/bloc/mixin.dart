import 'package:authapp/feature/home/home_view.dart';
import 'package:authapp/feature/profile_edit/bloc/state.dart';
import 'package:authapp/product/core/base/helper/logger_package.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/core/base/helper/show_dialogs.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:flutter/widgets.dart';

mixin ProfilEditMixin {
  final printLogger = CustomLoggerPrint();
  void profilEditListenerBloc(BuildContext context, ProfileEditState state) {
    switch (state.runtimeType) {
      case ProfileEditSuccessState:
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: (state as ProfileEditSuccessState).message,
        );
        Future.delayed(
            const Duration(
              seconds: 3,
            ), () {
          CodeNoahNavigatorRouter.pushAndRemoveUntil(
            context,
            const HomeView(),
          );
        });
      case ProfileEditErrorState:
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: (state as ProfileEditErrorState).errorMessage,
        );
        break;
      case ProfileEditLoadingState:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteBoldText(
            text: 'Please Wait...',
            textAlign: TextAlign.center,
          ),
        );
      default:
        printLogger.printInfoLog('Missing Case Available');
    }
  }
}
