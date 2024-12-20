import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mime/mime.dart';
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
  bool isAdmin;
  bool isVerified;

  LoginResponseEntity({
    required this.accessToken,
    required this.avatar,
    required this.fullname,
    required this.nextStep,
    this.isAdmin = false,
    this.isVerified = false,
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
  String? bio;
  bool isAdmin;
  bool isVerified;

  CurrentUserEntity({
    required this.email,
    required this.avatar,
    required this.fullname,
    required this.nextStep,
    this.bio,
    this.isAdmin = false,
    this.isVerified = false,
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
  GenderEnum? gender;
  List<GenderEnum> whoWantToDate;
  AcademicLevelEnum education;
  int? tall;
  int? weight;

  UpdateProfileEntity({
    this.birthday,
    this.gender,
    this.whoWantToDate = const [],
    this.education = AcademicLevelEnum.BachelorDegree,
    this.tall,
    this.weight,
  });

  bool get isValid =>
      gender != null &&
      birthday != null &&
      whoWantToDate.isNotEmpty &&
      tall != 0 &&
      weight != 0;

  Map<String, dynamic> toJson() => _$UpdateProfileEntityToJson(this);
}

@JsonSerializable(createFactory: false)
class PicturesEntity {
  List<dynamic> pictures;
  @JsonKey(includeToJson: false)
  List<PictureIndex> picturesFile;

  PicturesEntity({
    required this.pictures,
    required this.picturesFile,
  });

  bool get isValid => picturesFile.length < 2;

  Future<void> convertFile() async {
    for (var pic in picturesFile) {
      final file = await MultipartFile.fromFile(
        pic.file.path,
        contentType: MediaType.parse(
          lookupMimeType(pic.file.path).toString(),
        ),
      );
      pictures.add(file);
    }
  }

  Map<String, dynamic> toJson() => _$PicturesEntityToJson(this);
}

class PictureIndex {
  final int index;
  final File file;

  PictureIndex({
    required this.index,
    required this.file,
  });
}

@JsonSerializable(createFactory: false)
class WordIntoEntity {
  List<WordIntoEnum> words;

  WordIntoEntity({
    this.words = const [],
  });

  bool get isValid => words.length >= 5;

  Map<String, dynamic> toJson() => _$WordIntoEntityToJson(this);
}

@JsonSerializable(createFactory: false)
class UpdateLocationEntity {
  double? lat;
  double? long;
  UpdateLocationEntity({
    this.lat,
    this.long,
  });

  bool get isValid => lat != null && long != null;

  Map<String, dynamic> toJson() => _$UpdateLocationEntityToJson(this);
}
