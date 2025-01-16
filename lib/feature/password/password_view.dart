import 'package:authapp/feature/password/password_viewmodel.dart';
import 'package:authapp/product/core/base/helper/button_control.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/widget/button.dart';
import 'package:authapp/product/widget/widget/email_field.dart';
import 'package:authapp/product/widget/widget/title_subtitle.dart';
import 'package:flutter/material.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends PasswordViewModel {
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
          text: 'Forgot Password',
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: formPasswordKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: Column(
            children: <Widget>[
              // title sub title
              buildTitleSubTitleWidget,
              // e-mail field
              buildEmailFieldWidget,
              // send button
              buildSendButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // title sub title
  TitleSubTitleWidget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        title: 'Forgot your account password?',
        subTitle:
            'You can reset your password by entering your e-mail address registered in the system.',
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // e-mail field
  CustomEmailFieldWidget get buildEmailFieldWidget => CustomEmailFieldWidget(
        emailController: emailController,
        hintText: 'E-mail',
        onChanged: (val) {},
        isLabelText: true,
      );

  // send button
  CustomButtonWidget get buildSendButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'SEND CODE',
        func: sendCode,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}