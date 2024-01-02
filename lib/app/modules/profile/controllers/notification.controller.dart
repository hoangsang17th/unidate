import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/modules/profile/entities/notification.entity.dart';
import 'package:unidate/app/modules/profile/providers/notification.provider.dart';

class NotificationController extends GetxController {
  final NotificationProvider _notificationProvider = NotificationProvider();

  RefreshController refreshController = RefreshController();

  final RxList<NotificationEntity> _notificationList =
      <NotificationEntity>[].obs;
  List<NotificationEntity> get notifications => _notificationList.value;

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool v) => _isLoading.value = v;

  @override
  void onInit() {
    super.onInit();
    getNotificationList();
  }

  Future<void> getNotificationList() async {
    try {
      _notificationList.value = await _notificationProvider.getNotifications();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    refreshController.refreshCompleted();
  }

  Future<void> markRead(int notificationId) async {
    try {
      await _notificationProvider.markRead(notificationId);
      _notificationList
          .firstWhere((element) => element.id == notificationId)
          .isRead = true;
      _notificationList.refresh();
    } catch (e) {
      print(e);
    }
  }
}
