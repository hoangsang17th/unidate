import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/modules/profile/entities/notification.entity.dart';

class NotificationProvider {
  NotificationProvider();

  final String _baseUrl = 'notification';

  Future<List<NotificationEntity>> getNotifications() async {
    try {
      final response = await AppHttpHelper.instance.get(_baseUrl);
      return response.data
          .map<NotificationEntity>((e) => NotificationEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markRead(int notificationId) async {
    try {
      await AppHttpHelper.instance.delete('$_baseUrl/$notificationId');
      return;
    } catch (e) {
      rethrow;
    }
  }
}
