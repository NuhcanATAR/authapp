import 'package:authapp/feature/otp/view/new_password/new_password_viewmodel.dart';
import 'package:authapp/product/core/base/helper/button_control.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/widget/button.dart';
import 'package:authapp/product/widget/widget/password_field.dart';
import 'package:authapp/product/widget/widget/title_subtitle.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends NewPasswordViewModel {
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
        key: formNewPasswordKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: Column(
            children: <Widget>[
              // title sub title
              buildTitleSubTitleWidget,
              // passwords field
              buildPasswordFieldsWidget,
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

  // passwords field
  Column get buildPasswordFieldsWidget => Column(
        children: <Widget>[
          // password
          CustomPasswordFieldWidget(
            passwordController: passwordController,
            hintText: 'Password',
            onChanged: (val) {},
            isLabelText: true,
            isValidator: true,
          ),
          // repead password
          CustomPasswordFieldWidget(
            passwordController: repeadPasswordController,
            hintText: 'Password Repeat',
            onChanged: (val) {},
            isLabelText: true,
            isValidator: true,
          ),
        ],
      );

  // send button
  CustomButtonWidget get buildSendButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'SEND CODE',
        func: onPasswordChanged,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
