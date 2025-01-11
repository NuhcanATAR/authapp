import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInInProgress extends SignInState {}

class SignInSuccess extends SignInState {
  final String token;

  SignInSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
