// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserParam _$VerifyUserParamFromJson(Map<String, dynamic> json) =>
    VerifyUserParam(
      status: $enumDecodeNullable(_$VerifyStatusEnumMap, json['status']) ??
          VerifyStatus.Waiting,
      userName: json['userName'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$VerifyUserParamToJson(VerifyUserParam instance) =>
    <String, dynamic>{
      'status': _$VerifyStatusEnumMap[instance.status]!,
      'userName': instance.userName,
      'id': instance.id,
    };

const _$VerifyStatusEnumMap = {
  VerifyStatus.Waiting: 'Waiting',
  VerifyStatus.Verified: 'Verified',
  VerifyStatus.Reject: 'Reject',
};

VerifyUserEntity _$VerifyUserEntityFromJson(Map<String, dynamic> json) =>
    VerifyUserEntity(
      id: json['id'] as int,
      status: $enumDecode(_$VerifyStatusEnumMap, json['status']),
      updatedAt: const JsonSerializableDateTime()
          .fromJson(json['updatedAt'] as String),
      fullname: json['fullname'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$VerifyUserEntityToJson(VerifyUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$VerifyStatusEnumMap[instance.status]!,
      'updatedAt': const JsonSerializableDateTime().toJson(instance.updatedAt),
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'email': instance.email,
      'userId': instance.userId,
    };

UserSystemEntity _$UserSystemEntityFromJson(Map<String, dynamic> json) =>
    UserSystemEntity(
      id: json['id'] as int,
      fullname: json['fullname'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$UserSystemEntityToJson(UserSystemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'email': instance.email,
      'isVerified': instance.isVerified,
    };
