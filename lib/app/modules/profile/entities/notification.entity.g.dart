// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      id: json['id'] as int,
      isRead: json['isRead'] as bool,
      avatar: json['avatar'] as String,
      content: json['content'] as String,
      createdAt: const JsonSerializableDateTime()
          .fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRead': instance.isRead,
      'avatar': instance.avatar,
      'content': instance.content,
      'createdAt': const JsonSerializableDateTime().toJson(instance.createdAt),
    };
