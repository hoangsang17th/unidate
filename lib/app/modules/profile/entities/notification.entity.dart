import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/core/utils/datetime.util.dart';

part 'notification.entity.g.dart';

@JsonSerializableDateTime()
@JsonSerializable()
class NotificationEntity {
  final int id;
  bool isRead;
  final String avatar;
  final String content;
  final DateTime createdAt;

  NotificationEntity({
    required this.id,
    required this.isRead,
    required this.avatar,
    required this.content,
    required this.createdAt,
  });
  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}
