import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/data/entities/conversation.entity.dart';

class ConversationProvider {
  ConversationProvider();

  Future<List<ConversationEntity>> getConversations(String? searchKey) async {
    try {
      final response = await AppHttpHelper.instance
          .get('conversation', queryParameters: {'searchKey': searchKey});
      return response.data
          .map<ConversationEntity>((e) => ConversationEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessageEntity>> getConversation(int conversationId) async {
    try {
      final response =
          await AppHttpHelper.instance.get('conversation/$conversationId');
      return response.data
          .map<MessageEntity>((e) => MessageEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
