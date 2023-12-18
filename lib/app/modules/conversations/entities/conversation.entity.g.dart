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
      id: json['id'] as int,
      text: json['text'] as String,
      avatar: json['avatar'] as String,
      sendTime:
          const JsonSerializableDateTime().fromJson(json['sendTime'] as String),
      isYouSend: json['isYouSend'] as bool? ?? true,
    );
