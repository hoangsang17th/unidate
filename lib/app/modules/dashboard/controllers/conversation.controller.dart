import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/data/entities/conversation.entity.dart';
import 'package:unidate/app/data/providers/conversation.provider.dart';

class ConversationController extends GetxController {
  final ConversationProvider _conversationProvider = ConversationProvider();

  final RxList<ConversationEntity> _conversations = <ConversationEntity>[].obs;

  List<ConversationEntity> get conversations => _conversations;
  final RefreshController refreshController = RefreshController();
  RxBool isLoading = true.obs;

  
  @override
  void onInit() {
    super.onInit();
    getConversations();
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
}
