// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      (json['id'] as num).toInt(),
      json['name'] as String?,
      json['surname'] as String?,
      json['bio'] as String?,
    );
Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'bio': instance.bio,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      (json['id'] as num).toInt(),
      json['email'] as String,
      json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profile': instance.profile,
    };
