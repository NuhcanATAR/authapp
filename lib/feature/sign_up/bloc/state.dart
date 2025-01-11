import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
  final String errorMessage;

  SignUpError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
