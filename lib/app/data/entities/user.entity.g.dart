// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RegisterEntityToJson(RegisterEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'isValid': instance.isValid,
    };

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    LoginResponseEntity(
      accessToken: json['accessToken'] as String,
      avatar: json['avatar'] as String,
      fullname: json['fullname'] as String,
      nextStep: $enumDecode(_$UserStepSetupEnumMap, json['nextStep']),
    );

const _$UserStepSetupEnumMap = {
  UserStepSetup.Bio: 'Bio',
  UserStepSetup.Profile: 'Profile',
  UserStepSetup.Pictures: 'Pictures',
  UserStepSetup.WordInto: 'WordInto',
  UserStepSetup.Location: 'Location',
  UserStepSetup.Done: 'Done',
};

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
      'isValid': instance.isValid,
    };

CurrentUserEntity _$CurrentUserEntityFromJson(Map<String, dynamic> json) =>
    CurrentUserEntity(
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      fullname: json['fullname'] as String,
      nextStep: $enumDecode(_$UserStepSetupEnumMap, json['nextStep']),
    );
