import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/core/utils/datetime.util.dart';
import 'package:unidate/app/modules/profile/enums.dart';

part 'user.entity.g.dart';

@JsonSerializable(createFactory: false)
class RegisterEntity {
  String? name;
  String? email;
  String? password;
  String? fullname;
  dynamic avatar;
  @JsonKey(includeToJson: false)
  File? avatarFile;

  RegisterEntity({
    this.name,
    this.email,
    this.password,
    this.fullname,
    this.avatar,
    this.avatarFile,
  });

  bool get isValid =>
      email != null &&
      password != null &&
      fullname != null &&
      avatarFile != null;

  Map<String, dynamic> toJson() => _$RegisterEntityToJson(this);
}

@JsonSerializable(createToJson: false)
class LoginResponseEntity {
  String accessToken;
  String avatar;
  String fullname;
  UserStepSetup nextStep;

  LoginResponseEntity({
    required this.accessToken,
    required this.avatar,
    required this.fullname,
    required this.nextStep,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);
}

@JsonSerializable(createFactory: false)
class LoginEntity {
  String? password;
  String? email;

  LoginEntity({
    this.password,
    this.email,
  });

  bool get isValid => email != null && password != null;

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);
}

@JsonSerializable(createToJson: false)
class CurrentUserEntity {
  String email;
  String avatar;
  String fullname;
  UserStepSetup nextStep;

  CurrentUserEntity({
    required this.email,
    required this.avatar,
    required this.fullname,
    required this.nextStep,
  });

  factory CurrentUserEntity.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserEntityFromJson(json);
}

@JsonSerializable(createToJson: false)
class NextStepEntity {
  UserStepSetup nextStep;

  NextStepEntity({
    required this.nextStep,
  });

  factory NextStepEntity.fromJson(Map<String, dynamic> json) =>
      _$NextStepEntityFromJson(json);
}

@JsonSerializableDateTime()
@JsonSerializable(createFactory: false)
class UpdateProfileEntity {
  DateTime? birthday;
  GenderEnum gender;
  List<GenderEnum> whoWantToDate;
  AcademicLevelEnum education;
  int tall;
  int weight;

  UpdateProfileEntity({
    this.birthday,
    this.gender = GenderEnum.Man,
    this.whoWantToDate = const [],
    this.education = AcademicLevelEnum.BachelorDegree,
    this.tall = 170,
    this.weight = 48,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileEntityToJson(this);
}
