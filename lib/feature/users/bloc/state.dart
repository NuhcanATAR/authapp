import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UsersState extends Equatable {}

class UsersInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoading extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoadedState extends UsersState {
  final List<UserModel> users;

  UsersLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

class UsersError extends UsersState {
  final String error;

  UsersError(this.error);

  @override
  List<Object?> get props => [error];
}
