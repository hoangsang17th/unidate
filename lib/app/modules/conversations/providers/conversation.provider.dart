import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';

class ConversationProvider {
  ConversationProvider();

  final String _baseUrl = 'conversation';

  Future<List<ConversationEntity>> getConversations(String? searchKey) async {
    try {
      final response = await AppHttpHelper.instance
          .get(_baseUrl, queryParameters: {'searchKey': searchKey});
      return response.data
          .map<ConversationEntity>((e) => ConversationEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessageEntity>> getMessages(int conversationId) async {
    try {
      final response =
          await AppHttpHelper.instance.get('$_baseUrl/$conversationId');
      return response.data
          .map<MessageEntity>((e) => MessageEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
