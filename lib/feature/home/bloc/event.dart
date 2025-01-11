import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeUserEvent extends HomeEvent {
  final String token;

  HomeUserEvent(this.token);

  @override
  List<Object> get props => [token];
}
