import 'package:equatable/equatable.dart';

abstract class ProfileEditEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileEvent extends ProfileEditEvent {
  final String name;
  final String surname;
  final String bio;

  ProfileEvent(
    this.name,
    this.surname,
    this.bio,
  );

  @override
  List<Object> get props => [name, surname, bio];
}
