import 'package:authapp/feature/otp/otp_viewmodel.dart';
import 'package:authapp/product/core/base/helper/button_control.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/widget/button.dart';
import 'package:authapp/product/widget/widget/otp_code.dart';
import 'package:authapp/product/widget/widget/title_subtitle.dart';
import 'package:flutter/material.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends OtpViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const BodyMediumBlackText(
          text: 'OTP Code',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingNormalValue,
        ),
        child: ListView(
          children: <Widget>[
            // title sub title
            buildTitleSubTitleWidget,
            // otp code field
            buildOtpCodeFieldWidget,
            // verification button
            buildVerificationButtonWidget,
          ],
        ),
      ),
    );
  }

  // title sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        title: 'Please check the code coming from your e-mail address.',
        subTitle: 'Please send the code to your e-mail address',
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // otp code
  Widget get buildOtpCodeFieldWidget => OtpCodeFieldWidget(
        onCodeChanged: (String code) {
          setState(() {
            otpCode = code;
          });
        },
        onSubmit: (String verificationCode) {
          otpCode = verificationCode;
        },
      );

  // verification button
  Widget get buildVerificationButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'CORRECT',
        func: validateOtp,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
