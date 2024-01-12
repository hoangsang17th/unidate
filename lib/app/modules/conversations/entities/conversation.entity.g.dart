// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationEntity _$ConversationEntityFromJson(Map<String, dynamic> json) =>
    ConversationEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      avatar: json['avatar'] as String,
      isYouSend: json['isYouSend'] as bool? ?? true,
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['lastTime'], const JsonSerializableDateTime().fromJson),
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['gender']),
      partnerId: json['partnerId'] as int,
      content: json['content'] as String?,
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$GenderEnumEnumMap = {
  GenderEnum.Man: 'Man',
  GenderEnum.Woman: 'Woman',
  GenderEnum.Other: 'Other',
};

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity(
      conversationId: json['conversationId'] as int?,
      id: json['id'] as int,
      text: json['text'] as String,
      avatar: json['avatar'] as String,
      sendTime:
          const JsonSerializableDateTime().fromJson(json['sendTime'] as String),
      isYouSend: json['isYouSend'] as bool? ?? true,
    );

Map<String, dynamic> _$ChatMessageEntityToJson(ChatMessageEntity instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'text': instance.text,
      'image': instance.image,
    };

BlockEntity _$BlockEntityFromJson(Map<String, dynamic> json) => BlockEntity(
      userId: json['userId'] as int,
      blockedUserId: json['blockedUserId'] as int,
    );

Map<String, dynamic> _$BlockEntityToJson(BlockEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'blockedUserId': instance.blockedUserId,
    };

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      to: json['to'] as int,
      relater: RelaterEntity.fromJson(json['relater'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'to': instance.to,
      'relater': instance.relater.toJson(),
    };

RelaterEntity _$RelaterEntityFromJson(Map<String, dynamic> json) =>
    RelaterEntity(
      fullname: json['fullname'] as String,
      avatar: json['avatar'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$RelaterEntityToJson(RelaterEntity instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'id': instance.id,
    };

BlockedEntity _$BlockedEntityFromJson(Map<String, dynamic> json) =>
    BlockedEntity(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      fullname: json['fullname'] as String,
      avatar: json['avatar'] as String,
      userId: json['userId'] as int,
      email: json['email'] as String,
    );

Map<String, dynamic> _$BlockedEntityToJson(BlockedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'fullname': instance.fullname,
      'avatar': instance.avatar,
      'userId': instance.userId,
      'email': instance.email,
    };
