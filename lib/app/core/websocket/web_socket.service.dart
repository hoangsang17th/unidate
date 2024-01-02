// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:get_storage/get_storage.dart';
// import 'package:web_socket_channel/io.dart';

// class WebSocketService {
//   WebSocketService._();

//   static final WebSocketService instance = WebSocketService._();

//   late IOWebSocketChannel _channel;
//   late int _senderId;
//   String _connectionId = "";

//   List<int> _subscribedHubs = [];

//   bool get _hasWebsocket => _channel.innerWebSocket != null;


//   void init() => connect();

//   void connect() {
//     _accessToken = _store.read(AppStorageKey.ACCESS_TOKEN) ?? '';
//     _senderId = AuthController.to.currentUser.id;

//     final connection =
//         '${AppFlavor.webSocketUrl}?userId=$_senderId&token=Bearer $_accessToken&userAgent=Cleeksy Mobile';

//     _channel = IOWebSocketChannel.connect(
//       Uri.parse(connection),
//       pingInterval: const Duration(minutes: 5),
//     );
//     _hasChannel = true;

//     ///
//     _requestConnectionId();

//     ///
//     _channel.stream.listen(_onMessage, onError: onError, onDone: onDone);
//   }

//   Future<void> disconnect() async {
//     try {
//       if (_hasWebsocket) {
//         await _channel.sink.close(WebSocketStatus.normalClosure);
//         _enableReconnect = false;
//       }
//     } catch (e) {
//       AppLogger.error(e);
//     }
//   }

//   void _reconnect() {
//     //disconnect if current channel still has connection
//     disconnect().then((value) async {
//       await AuthController.to.refreshTokenIfExpired();
//       AppLogger.info(
//         'Ws reconnect',
//         type: AppLoggerType.WEB_SOCKET,
//       );
//       connect();
//     });
//   }

//   void _onMessage(event) {
//     if (event == "") return;
//     try {
//       AppLogger.info(
//         "--WS on message: ${event.toString()}",
//         type: AppLoggerType.WEB_SOCKET,
//         sentry: false,
//       );

//       final message = WebSocketMessageModel.fromJson(json.decode(event));
//       if (message.action == WebSocketActionType.Ping) {
//         AppLogger.info(
//           'Ws notifyConnectionId $event',
//           type: AppLoggerType.WEB_SOCKET,
//         );
//         _connectionId = message.connectionId!;
//         _enableReconnect = true;
//         EventBusService.instance.fireEvent(
//           AppInternalEvent(
//             AppInternalEventEnum.WebSocketReconnected,
//             null,
//           ),
//         );
//         return;
//       } else
//         _handleHubMessage(message);
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   void onError(error, StackTrace stackTrace) {
//     AppLogger.error('Ws onError',
//         type: AppLoggerType.WEB_SOCKET, error: error, stackTrace: stackTrace);
//   }

//   void onDone() {
//     AppLogger.success(
//       'Ws onDone ${_channel.closeCode}',
//       type: AppLoggerType.WEB_SOCKET,
//     );
//     if (_ignoreReconnect) return;
//     //
//     if (_enableReconnect) {
//       _reconnect();
//       _enableReconnect = false;
//     }
//   }

//   void _requestConnectionId() {
//     final data = {
//       'action': WebSocketActionType.Ping,
//       'message': _senderId,
//     };
//     _channel.sink.add(jsonEncode(data));
//   }

//   void subscribeHub(int hubType, [hubData = '']) {
//     if (!_subscribedHubs.contains(hubType)) {
//       _subscribedHubs.add(hubType);
//     }

//     final isJsonEncode = hubData.runtimeType.toString().contains('List') ||
//         hubData.runtimeType.toString().contains('Object');

//     final HubSubscriptionModel data = HubSubscriptionModel(
//       senderId: _senderId.toString(),
//       connectionId: _connectionId,
//       hubType: hubType,
//       messageContentType: WebSocketMessageContentType.SubscribeHub,
//       message: isJsonEncode ? jsonEncode(hubData) : hubData,
//     );

//     final message = WebSocketMessageModel(
//       action: WebSocketActionType.HubSubscription,
//       data: data,
//     ).toJson();
//     AppLogger.info(
//       "--WS-- Subscribed to $hubType, hubData: $hubData",
//       type: AppLoggerType.WEB_SOCKET,
//     );

//     _channel.sink.add(jsonEncode(message));
//   }

//   void unsubscribeHub(int hubType, [hubData = '']) {
//     _subscribedHubs.removeWhere((_) => _ == hubType);

//     final isJsonEncode = hubData.runtimeType.toString().contains('List') ||
//         hubData.runtimeType.toString().contains('Object');

//     final HubSubscriptionModel data = HubSubscriptionModel(
//       senderId: _senderId.toString(),
//       connectionId: _connectionId,
//       hubType: hubType,
//       messageContentType: WebSocketMessageContentType.UnsubscribeHub,
//       message: isJsonEncode ? jsonEncode(hubData) : hubData,
//     );

//     final message = WebSocketMessageModel(
//       action: WebSocketActionType.HubSubscription,
//       data: data,
//     ).toJson();
//     AppLogger.info(
//       "--WS-- Unsubscribed to $hubType, hubData:  $hubData",
//       type: AppLoggerType.WEB_SOCKET,
//     );
//     _channel.sink.add(jsonEncode(message));
//   }

//   void _handleHubMessage(WebSocketMessageModel message) {
//     switch (message.action) {
//       case WebSocketActionType.NotificationHub:
//         EventBusService.instance.fireEvent(
//           ActivityInboxWebSocketEvent(message.data),
//         );
//         break;
//       case WebSocketActionType.ConversationHub:
//         final data = WebSocketMessage.fromJson(message.data);
//         EventBusService.instance.fireEvent(
//           ChatWebSocketEvent<WebSocketMessage>(data),
//         );
//         break;
//       case WebSocketActionType.WorkHub:
//         final data = WebSocketMessage.fromJson(message.data);
//         EventBusService.instance.fireEvent(
//           WorkWebSocketEvent<WebSocketMessage>(data),
//         );
//         break;

//       case WebSocketActionType.RequestHub:
//         final data = WebSocketMessage.fromJson(message.data);
//         EventBusService.instance.fireEvent(
//           RequestWebSocketEvent<WebSocketMessage>(data),
//         );
//         break;

//       case WebSocketActionType.IAMHub:
//         final data = WebSocketMessage.fromJson(message.data);
//         EventBusService.instance.fireEvent(
//           IAMWebSocketEvent<WebSocketMessage>(data),
//         );
//         break;
//       case WebSocketActionType.Reminder:
//         return;
//       // final data = WebSocketMessage.fromJson(message.data);
//       // EventBusService.instance.fireEvent(
//       //   ReminderWebSocketEvent<WebSocketMessage>(data),
//       // );
//       // break;
//       default:
//         break;
//     }
//   }

//   void multiSubscribeHub(int hubType, [dynamic hubDataSet]) {
//     if (hubDataSet is List && hubDataSet.isNotEmpty) {
//       hubDataSet.forEach((hubData) {
//         subscribeHub(hubType, [hubData]);
//       });
//     }
//   }

//   void multiUnsubscribeHub(int hubType, [dynamic hubDataSet]) {
//     if (hubDataSet is List && hubDataSet.isNotEmpty) {
//       hubDataSet.forEach((hubData) {
//         unsubscribeHub(hubType, [hubData]);
//       });
//     }
//   }
// }
