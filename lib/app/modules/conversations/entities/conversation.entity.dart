import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/core/utils/datetime.util.dart';
import 'package:unidate/app/modules/profile/enums.dart';

part 'conversation.entity.g.dart';

@JsonSerializableDateTime()
@JsonSerializable(createToJson: false)
class ConversationEntity {
  final int id;
  final String title;
  final String avatar;
  DateTime? lastTime;
  final GenderEnum? gender;
  String? content;
  int partnerId;
  final bool isYouSend;

  String get message {
    if (content != null) {
      final prefix = isYouSend ? 'You send: ' : '';
      return prefix + (content!.isImageFileName ? 'a photo' : content!);
    }
    return '${gender == GenderEnum.Man ? 'He' : 'She'} \'d like to chat with you';
  }

  ConversationEntity({
    required this.id,
    required this.title,
    required this.avatar,
    this.isYouSend = true,
    this.lastTime,
    this.gender,
    required this.partnerId,
    this.content,
  });

  factory ConversationEntity.fromJson(Map<String, dynamic> json) =>
      _$ConversationEntityFromJson(json);
}

@JsonSerializableDateTime()
@JsonSerializable(createToJson: false)
class MessageEntity {
  // WS will return conversationId
  final int? conversationId;
  final int id;
  final String text;
  final String avatar;
  final DateTime sendTime;
  final bool isYouSend;

  MessageEntity({
    this.conversationId,
    required this.id,
    required this.text,
    required this.avatar,
    required this.sendTime,
    this.isYouSend = true,
  });

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
}

@JsonSerializable(createFactory: false)
class ChatMessageEntity {
  final int conversationId;
  final String? text;
  final dynamic image;

  ChatMessageEntity({
    required this.conversationId,
    this.text,
    this.image,
  });

  Map<String, dynamic> toJson() => _$ChatMessageEntityToJson(this);
}

@JsonSerializable()
class BlockEntity {
  final int userId;
  final int blockedUserId;

  BlockEntity({
    required this.userId,
    required this.blockedUserId,
  });

  factory BlockEntity.fromJson(Map<String, dynamic> json) =>
      _$BlockEntityFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NotificationEntity {
  final int to;
  final RelaterEntity relater;

  NotificationEntity({
    required this.to,
    required this.relater,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}

@JsonSerializable()
class RelaterEntity {
  final String fullname;
  final String avatar;
  final int id;

  RelaterEntity({
    required this.fullname,
    required this.avatar,
    required this.id,
  });

  factory RelaterEntity.fromJson(Map<String, dynamic> json) =>
      _$RelaterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RelaterEntityToJson(this);
}

@JsonSerializable()
class BlockedEntity {
  int id;
  DateTime createdAt;
  String fullname;
  String avatar;
  int userId;
  String email;

  BlockedEntity({
    required this.id,
    required this.createdAt,
    required this.fullname,
    required this.avatar,
    required this.userId,
    required this.email,
  });

  factory BlockedEntity.fromJson(Map<String, dynamic> json) =>
      _$BlockedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BlockedEntityToJson(this);
}
