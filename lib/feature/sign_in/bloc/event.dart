import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequested extends SignInEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RememberMeControlEvent extends SignInEvent {
  final BuildContext context;

  RememberMeControlEvent({required this.context});
}
