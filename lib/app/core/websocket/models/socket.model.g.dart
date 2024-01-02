// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketMessageModel _$WebSocketMessageModelFromJson(
        Map<String, dynamic> json) =>
    WebSocketMessageModel(
      action: json['action'] as String,
      data: json['data'],
      connectionId: json['connectionId'] as String?,
    );

Map<String, dynamic> _$WebSocketMessageModelToJson(
        WebSocketMessageModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'data': instance.data,
      'connectionId': instance.connectionId,
    };

HubSubscriptionModel _$HubSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    HubSubscriptionModel(
      senderId: json['senderId'] as String,
      messageContentType: json['messageContentType'] as int,
      message: json['message'],
      connectionId: json['connectionId'] as String,
      hubType: json['hubType'] as int,
    );

Map<String, dynamic> _$HubSubscriptionModelToJson(
        HubSubscriptionModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'messageContentType': instance.messageContentType,
      'senderId': instance.senderId,
      'connectionId': instance.connectionId,
      'hubType': instance.hubType,
    };

WebSocketMessage _$WebSocketMessageFromJson(Map<String, dynamic> json) =>
    WebSocketMessage(
      senderId: json['senderId'] as String,
      messageContentType: json['messageContentType'] as int,
      message: json['message'],
      tenantId: json['tenantId'] as int?,
    );

Map<String, dynamic> _$WebSocketMessageToJson(WebSocketMessage instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'messageContentType': instance.messageContentType,
      'tenantId': instance.tenantId,
      'message': instance.message,
    };
