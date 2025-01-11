import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserProfile {
  final int id;
  final String? name;
  final String? surname;
  final String? bio;

  const UserProfile(this.id, this.name, this.surname, this.bio);

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class UserModel {
  final int id;
  final String email;
  final UserProfile? profile;

  const UserModel(this.id, this.email, this.profile);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
