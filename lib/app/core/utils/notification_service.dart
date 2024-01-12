import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/websocket/enums/web_socket.enum.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';
import 'package:unidate/app/routes/app_pages.dart';

class NotificationService {
  NotificationService._();

  static NotificationService get instance => NotificationService._();

  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;

  Future<void> init() async {
    if (_flutterLocalNotificationsPlugin != null) return;

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _flutterLocalNotificationsPlugin!
        .initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    )
        .then((value) {
      _flutterLocalNotificationsPlugin!
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    });
  }

  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    // Có thể tạo ra nhiều kênh khác nhau để hỗ trợ việc setup nhận thông báo trên ứng dụng
    // hoặc bên trong cài đặt
    // Nhưng project này chỉ cần 1 kênh duy nhất

    if (_flutterLocalNotificationsPlugin == null) {
      await init();
    }
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'unidate',
      'unidate',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin!.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse response) {
    print('123333');
    print(response.payload);
    if (response.payload == null) return;
    if (response.payload == WebSocketActionType.notification) {
      Get.toNamed(AppRoutes.NOTIFICATIONS);
      return;
    }

    if (response.payload!.contains(WebSocketActionType.matchingRecently)) {
      Get.toNamed(
        AppRoutes.PROFILE_DETAIL,
        arguments: UserDiscoveryEntity(
          id: int.parse(response.payload!.split(':')[1]),
        ),
      );
    }
  }
}
