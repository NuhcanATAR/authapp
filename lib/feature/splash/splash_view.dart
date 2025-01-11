import 'package:authapp/feature/splash/splash_viewmodel.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/title_large.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // logo
            const FlutterLogo(
              size: BaseUtility.iconLargeSecondSize,
            ),
            // text
            Padding(
              padding: BaseUtility.vertical(
                BaseUtility.paddingNormalValue,
              ),
              child: const TitleLargeBlackBoldSecondText(
                text: 'Auth App',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
