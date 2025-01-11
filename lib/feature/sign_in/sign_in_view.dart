import 'package:authapp/feature/sign_in/bloc/cubit.dart';
import 'package:authapp/feature/sign_in/bloc/state.dart';
import 'package:authapp/feature/sign_in/sign_in_viewmodel.dart';
import 'package:authapp/feature/sign_up/sign_up_view.dart';
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

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends SignInViewModel {
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
          text: 'Giriş Yap',
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocListener<SignInBloc, SignInState>(
        listener: signInListenerBloc,
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SignInInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            return buildBodyWidget(state);
          },
        ),
      ),
    );
  }

  // body
  Widget buildBodyWidget(SignInState state) => Form(
        key: formSignInKey,
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
                buildEmailPasswordWidget(state),
                // sign in and sign up
                buildSignInAndSignUpButtonWidget,
              ],
            ),
          ),
        ),
      );

  // title sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        title: 'Welcome to Auth App 👋',
        subTitle: 'Auth App SignIn with your account information.',
        dynamicViewExtensions: dynamicViewExtensions,
      );

  // email password
  Widget buildEmailPasswordWidget(SignInState state) => Column(
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
          if (state is SignInFailure) ...[
            BodyMediumRedText(
              text: state.errorMessage,
              textAlign: TextAlign.left,
            ),
          ],
        ],
      );

  // sign in and sign up
  Widget get buildSignInAndSignUpButtonWidget => Column(
        children: <Widget>[
          // sign in button
          CustomButtonWidget(
            dynamicViewExtensions: dynamicViewExtensions,
            text: 'SIGN IN',
            func: signIn,
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
                    text: 'Dont have an account yet?',
                    textAlign: TextAlign.right,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => CodeNoahNavigatorRouter.push(
                      context,
                      const SignUpView(),
                    ),
                    child: Padding(
                      padding: BaseUtility.left(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: const BodyMediumMainColorBoldText(
                        text: 'Sign Up',
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
