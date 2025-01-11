import 'package:equatable/equatable.dart';

abstract class ProfileEditState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileEditInitialState extends ProfileEditState {}

class ProfileEditLoadingState extends ProfileEditState {}

class ProfileEditSuccessState extends ProfileEditState {
  final String message;

  ProfileEditSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class ProfileEditErrorState extends ProfileEditState {
  final String errorMessage;

  ProfileEditErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
