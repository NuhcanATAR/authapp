import 'package:authapp/feature/sign_in/sign_in_view.dart';
import 'package:authapp/feature/splash/splash_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';

abstract class SplashViewModel extends BaseState<SplashView> {
  @override
  void initState() {
    super.initState();
    autoRoute();
  }

  void autoRoute() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      CodeNoahNavigatorRouter.pushAndRemoveUntil(
        context,
        const SignInView(),
      );
    });
  }
}
