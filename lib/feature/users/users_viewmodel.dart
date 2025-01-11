import 'package:authapp/feature/users/bloc/cubit.dart';
import 'package:authapp/feature/users/bloc/event.dart';
import 'package:authapp/feature/users/users_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UsersViewModel extends BaseState<UsersView> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    final tokenValue = await getToken();
    context.read<UsersBloc>().add(
          UsersLoadRequested(
            tokenValue,
          ),
        );
  }
}
