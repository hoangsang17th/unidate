import 'package:flutter/widgets.dart';
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

  final messageController = TextEditingController();

  final focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    setArgs();
    getConversation();
  }

  void setArgs() {
    final data = (Get.arguments as List<dynamic>);
    _conversation.value = data.first;
    if (data.length > 1) {
      setMessage(data[1]);
    }
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

  void setMessage(String message) {
    messageController.text = message;
    focusNode.requestFocus();
  }
}
