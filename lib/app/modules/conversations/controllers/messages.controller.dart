import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/conversations/providers/conversation.provider.dart';

class MessagesController extends GetxController {
  final ConversationProvider _conversationProvider = ConversationProvider();

  final RxList<MessageEntity> _messages = <MessageEntity>[].obs;
  List<MessageEntity> get messages => _messages;

  RxBool isLoading = true.obs;

  final Rxn<ConversationEntity> _conversation = Rxn<ConversationEntity>();
  ConversationEntity get conversation => _conversation.value!;

  int get conversationId => conversation.id;

  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    _conversation.value = Get.arguments as ConversationEntity;
    getConversation();
  }

  Future<void> getConversation() async {
    try {
      final res = await _conversationProvider.getMessages(conversationId);
      _messages(res);
      isLoading(false);
      refreshController.refreshCompleted();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
