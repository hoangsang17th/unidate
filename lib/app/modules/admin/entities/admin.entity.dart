// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/core/utils/datetime.util.dart';

part 'admin.entity.g.dart';

@JsonSerializable()
class VerifyUserParam {
  VerifyStatus status;

  String? userName;
  int? id;
  VerifyUserParam({
    this.status = VerifyStatus.Waiting,
    this.userName,
    this.id,
  });

  factory VerifyUserParam.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserParamFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyUserParamToJson(this);
}

@JsonSerializable()
@JsonSerializableDateTime()
class VerifyUserEntity {
  int id;

  VerifyStatus status;
  DateTime updatedAt;
  String fullname;
  String avatar;
  String email;
  int userId;

  VerifyUserEntity({
    required this.id,
    required this.status,
    required this.updatedAt,
    required this.fullname,
    required this.avatar,
    required this.email,
    required this.userId,
  });

  factory VerifyUserEntity.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyUserEntityToJson(this);
}

@JsonEnum()
enum VerifyStatus {
  Waiting,
  Verified,
  Reject,
}

@JsonSerializable()
class UserSystemEntity {
  int id;
  String fullname;
  String avatar;
  String email;
  bool isVerified;

  UserSystemEntity({
    required this.id,
    required this.fullname,
    required this.avatar,
    required this.email,
    this.isVerified = false,
  });

  factory UserSystemEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSystemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserSystemEntityToJson(this);
}
