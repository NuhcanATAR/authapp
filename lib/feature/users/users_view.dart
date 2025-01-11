import 'package:authapp/feature/users/bloc/cubit.dart';
import 'package:authapp/feature/users/bloc/state.dart';
import 'package:authapp/feature/users/users_viewmodel.dart';
import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:authapp/product/widget/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends UsersViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoadedState) {
            final List<UserModel> users = state.users;
            return buildBodyWidget(users);
          } else if (state is UsersError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(
              child: Text('Error occurred, please try again later..'),
            );
          }
        },
      ),
    );
  }

  // body
  Widget buildBodyWidget(List<UserModel> users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserCardWidget(
            user: user,
          );
        },
      );
}
