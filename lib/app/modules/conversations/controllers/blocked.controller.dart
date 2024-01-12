import 'package:get/get.dart';
import 'package:unidate/app/modules/conversations/controllers/conversation.controller.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/conversations/providers/conversation.provider.dart';

class BlockedController extends GetxController {
  final ConversationProvider _conversationProvider = ConversationProvider();
  RxList<BlockedEntity> blockedUsers = <BlockedEntity>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBlocks();
  }

  Future<void> getBlocks() async {
    try {
      blockedUsers.value = await _conversationProvider.getBlocks();
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  Future<void> unBlock(int id) async {
    try {
      await _conversationProvider.unBlock(id);
      await getBlocks();
      ConversationController.to.getConversations();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
