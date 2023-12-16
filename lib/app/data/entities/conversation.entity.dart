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
  final DateTime? lastTime;
  final GenderEnum? gender;
  final String? content;
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
    this.content,
  });

  factory ConversationEntity.fromJson(Map<String, dynamic> json) =>
      _$ConversationEntityFromJson(json);
}

@JsonSerializableDateTime()
@JsonSerializable(createToJson: false)
class MessageEntity {
  final int id;
  final String text;
  final String avatar;
  final DateTime sendTime;
  final bool isYouSend;

  MessageEntity({
    required this.id,
    required this.text,
    required this.avatar,
    required this.sendTime,
    this.isYouSend = true,
  });

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
}
