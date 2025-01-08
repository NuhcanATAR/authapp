import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
