import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final UserModel userModel;

  HomeLoaded(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
