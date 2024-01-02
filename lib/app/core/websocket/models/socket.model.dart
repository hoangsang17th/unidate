import 'package:json_annotation/json_annotation.dart';

part 'socket.model.g.dart';

class IWebSocketMessageData {
  final String senderId;
  final int messageContentType;
  final dynamic message;

  IWebSocketMessageData({
    required this.senderId,
    required this.messageContentType,
    this.message,
  });
}

@JsonSerializable(explicitToJson: true)
class WebSocketMessageModel {
  final String action;
  final dynamic data;
  final String? connectionId;

  WebSocketMessageModel({
    required this.action,
    required this.data,
    this.connectionId,
  });

  factory WebSocketMessageModel.fromJson(Map<String, dynamic> json) =>
      _$WebSocketMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketMessageModelToJson(this);
}

@JsonSerializable()
class HubSubscriptionModel implements IWebSocketMessageData {
  @override
  dynamic message;

  @override
  int messageContentType;

  @override
  String senderId;

  String connectionId;
  int hubType;

  HubSubscriptionModel({
    required this.senderId,
    required this.messageContentType,
    this.message,
    required this.connectionId,
    required this.hubType,
  });

  factory HubSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$HubSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$HubSubscriptionModelToJson(this);
}

///
///

@JsonSerializable(explicitToJson: true)
class WebSocketMessage {
  final String senderId;
  final int messageContentType;
  final int? tenantId;
  final dynamic message;

  WebSocketMessage({
    required this.senderId,
    required this.messageContentType,
    this.message,
    this.tenantId,
  });

  factory WebSocketMessage.fromJson(Map<String, dynamic> json) =>
      _$WebSocketMessageFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketMessageToJson(this);
}
