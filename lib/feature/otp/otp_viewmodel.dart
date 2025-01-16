import 'package:authapp/feature/otp/otp_view.dart';
import 'package:authapp/feature/otp/view/new_password/new_password_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/core/base/helper/show_dialogs.dart';

abstract class OtpViewModel extends BaseState<OtpView> {
  String otpCode = '';

  void validateOtp() {
    if (otpCode.isEmpty || otpCode.length < 5) {
      CodeNoahDialogs(context).showFlush(
        type: SnackType.error,
        message: 'Please Enter a Valid Code!',
      );
    } else {
      CodeNoahNavigatorRouter.pushAndRemoveUntil(
        context,
        const NewPasswordView(),
      );
    }
  }
}
