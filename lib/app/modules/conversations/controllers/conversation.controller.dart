import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/conversations/providers/conversation.provider.dart';
import 'package:unidate/app/routes/app_pages.dart';

class ConversationController extends GetxController {
  static ConversationController get to => Get.find();

  final ConversationProvider _conversationProvider = ConversationProvider();

  final RxList<ConversationEntity> _conversations = <ConversationEntity>[].obs;

  List<ConversationEntity> get conversations => _conversations;
  final RefreshController refreshController = RefreshController();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    await getConversations();
  }

  Future<void> getConversations([String? searchKey]) async {
    try {
      final res = await _conversationProvider.getConversations(searchKey);
      _conversations(res);
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> onRefresh() async {
    await getConversations();
    refreshController.refreshCompleted();
  }

  Future<void> openConversationById(int id) async {
    EasyLoading.show(status: 'Loading...');
    // Lúc này view vẫn chưa có conversation mới tạo
    await getConversations();
    EasyLoading.dismiss();
    final conversation = conversations.firstWhere((_) => _.id == id);
    Get.toNamed(
      AppRoutes.MESSAGES,
      arguments: [
        conversation,
        'Hello ${conversation.title}! Cho mình làm quen nhé?'
      ],
    );
  }

  void onWsMessage(MessageEntity message) {
    final conversation =
        conversations.firstWhere((_) => _.id == message.conversationId);
    conversation.content = message.text;
    conversation.lastTime = message.sendTime;
    _conversations.refresh();
  }

  void onRemoveConversation(int partnerId) {
    _conversations.removeWhere((_) => _.partnerId == partnerId);
    _conversations.refresh();
  }
}
