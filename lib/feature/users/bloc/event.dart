import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {}

class UsersLoadRequested extends UsersEvent {
  final String authToken;

  UsersLoadRequested(this.authToken);

  @override
  List<Object?> get props => [authToken];
}
