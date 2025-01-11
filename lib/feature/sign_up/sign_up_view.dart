import 'package:authapp/feature/sign_in/sign_in_view.dart';
import 'package:authapp/feature/sign_up/bloc/cubit.dart';
import 'package:authapp/feature/sign_up/bloc/state.dart';
import 'package:authapp/feature/sign_up/sign_up_viewmodel.dart';
import 'package:authapp/product/core/base/helper/button_control.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/widget/button.dart';
import 'package:authapp/product/widget/widget/email_field.dart';
import 'package:authapp/product/widget/widget/password_field.dart';
import 'package:authapp/product/widget/widget/title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends SignUpViewmodel {
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
          text: 'Register Now',
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: signUpListenerBloc,
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return buildBodyWidget;
          },
        ),
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Form(
        key: formSignUpKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // title sub title
                buildTitleSubTitleWidget,
                // email password
                buildEmailPasswordWidget,
                // sign in and sign up
                buildSignInAndSignUpButtonWidget,
              ],
            ),
          ),
        ),
      );

  // title sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        title: 'Register Auth App👋',
        subTitle: 'Auth App Sign Up with your account information.',
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // email password
  Widget get buildEmailPasswordWidget => Column(
        children: <Widget>[
          // email
          CustomEmailFieldWidget(
            emailController: emailController,
            hintText: 'E-mail',
            onChanged: (val) {},
            isLabelText: true,
          ),
          // password
          CustomPasswordFieldWidget(
            passwordController: passwordController,
            hintText: 'Password',
            onChanged: (val) {},
            isValidator: true,
            isLabelText: true,
          ),
        ],
      );

  // sign in and sign up
  Widget get buildSignInAndSignUpButtonWidget => Column(
        children: <Widget>[
          // sign in button
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: 'SIGN UP',
            func: signUp,
            btnStatus: ButtonTypes.primaryColorButton,
          ),
          // register
          Padding(
            padding: BaseUtility.vertical(
              BaseUtility.paddingHightValue,
            ),
            child: Row(
              children: <Widget>[
                const Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: BodyMediumBlackText(
                    text: 'Do you already have an account?',
                    textAlign: TextAlign.right,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => CodeNoahNavigatorRouter.push(
                      context,
                      const SignInView(),
                    ),
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: const BodyMediumMainColorBoldText(
                        text: 'Sign In',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
