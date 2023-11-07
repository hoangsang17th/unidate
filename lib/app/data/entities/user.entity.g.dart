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

NextStepEntity _$NextStepEntityFromJson(Map<String, dynamic> json) =>
    NextStepEntity(
      nextStep: $enumDecode(_$UserStepSetupEnumMap, json['nextStep']),
    );

Map<String, dynamic> _$UpdateProfileEntityToJson(
        UpdateProfileEntity instance) =>
    <String, dynamic>{
      'birthday': _$JsonConverterToJson<String, DateTime>(
          instance.birthday, const JsonSerializableDateTime().toJson),
      'gender': _$GenderEnumEnumMap[instance.gender],
      'whoWantToDate':
          instance.whoWantToDate.map((e) => _$GenderEnumEnumMap[e]!).toList(),
      'education': _$AcademicLevelEnumEnumMap[instance.education]!,
      'tall': instance.tall,
      'weight': instance.weight,
      'isValid': instance.isValid,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

const _$GenderEnumEnumMap = {
  GenderEnum.Man: 'Man',
  GenderEnum.Woman: 'Woman',
  GenderEnum.Other: 'Other',
};

const _$AcademicLevelEnumEnumMap = {
  AcademicLevelEnum.BachelorDegree: 'BachelorDegree',
  AcademicLevelEnum.AtUni: 'AtUni',
  AcademicLevelEnum.HighSchool: 'HighSchool',
  AcademicLevelEnum.PhD: 'PhD',
  AcademicLevelEnum.OnAGraduateCourse: 'OnAGraduateCourse',
  AcademicLevelEnum.MasterDegree: 'MasterDegree',
  AcademicLevelEnum.TradeSchool: 'TradeSchool',
  AcademicLevelEnum.Other: 'Other',
};
