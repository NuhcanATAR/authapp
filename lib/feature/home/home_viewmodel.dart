import 'package:authapp/feature/home/bloc/cubit.dart';
import 'package:authapp/feature/home/bloc/event.dart';
import 'package:authapp/feature/home/home_view.dart';
import 'package:authapp/feature/sign_in/sign_in_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/core/base/helper/shared_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final token = await getToken();
    if (token.isNotEmpty) {
      BlocProvider.of<HomeBloc>(context).add(HomeUserEvent(token));
    }
  }

  void signOut() {
    prefService.saveString(SharedKeys.token, '');
    prefService.setBool(SharedKeys.rememberMe, false);
    CodeNoahNavigatorRouter.pushAndRemoveUntil(
      context,
      const SignInView(),
    );
  }
}
