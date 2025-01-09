import 'package:authapp/feature/home/bloc/cubit.dart';
import 'package:authapp/feature/home/bloc/event.dart';
import 'package:authapp/feature/home/home_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:authapp/product/core/base/helper/shared_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final token = await getToken();
    if (token.isNotEmpty) {
      BlocProvider.of<HomeBloc>(context).add(HomeUserEvent(token));
    } else {
      // Eğer token yoksa, kullanıcıyı oturum açma ekranına yönlendirebilirsiniz
      print('Token bulunamadı!');
    }
  }

  Future<String> getToken() async {
    final String? tokenValue = await prefService.getString(SharedKeys.token);
    return tokenValue ?? '';
  }
}
