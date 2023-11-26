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

Map<String, dynamic> _$PicturesEntityToJson(PicturesEntity instance) =>
    <String, dynamic>{
      'pictures': instance.pictures,
      'isValid': instance.isValid,
    };

Map<String, dynamic> _$WordIntoEntityToJson(WordIntoEntity instance) =>
    <String, dynamic>{
      'words': instance.words.map((e) => _$WordIntoEnumEnumMap[e]!).toList(),
      'isValid': instance.isValid,
    };

const _$WordIntoEnumEnumMap = {
  WordIntoEnum.Sport: 'Sport',
  WordIntoEnum.Music: 'Music',
  WordIntoEnum.Movie: 'Movie',
  WordIntoEnum.Book: 'Book',
  WordIntoEnum.Game: 'Game',
  WordIntoEnum.Travel: 'Travel',
  WordIntoEnum.Food: 'Food',
  WordIntoEnum.Art: 'Art',
  WordIntoEnum.Science: 'Science',
  WordIntoEnum.Technology: 'Technology',
  WordIntoEnum.Business: 'Business',
  WordIntoEnum.Politics: 'Politics',
  WordIntoEnum.Fashion: 'Fashion',
  WordIntoEnum.Beauty: 'Beauty',
  WordIntoEnum.Health: 'Health',
  WordIntoEnum.Fitness: 'Fitness',
  WordIntoEnum.Lifestyle: 'Lifestyle',
  WordIntoEnum.Relationship: 'Relationship',
  WordIntoEnum.Family: 'Family',
  WordIntoEnum.Education: 'Education',
  WordIntoEnum.Career: 'Career',
  WordIntoEnum.Money: 'Money',
  WordIntoEnum.Home: 'Home',
  WordIntoEnum.Garden: 'Garden',
  WordIntoEnum.Pet: 'Pet',
  WordIntoEnum.Car: 'Car',
  WordIntoEnum.Motorcycle: 'Motorcycle',
  WordIntoEnum.SportCar: 'SportCar',
  WordIntoEnum.Other: 'Other',
};

Map<String, dynamic> _$UpdateLocationEntityToJson(
        UpdateLocationEntity instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'isValid': instance.isValid,
    };
