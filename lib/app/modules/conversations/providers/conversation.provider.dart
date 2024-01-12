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

  Future<String?> chat(ChatMessageEntity mess) async {
    try {
      final response = await AppHttpHelper.instance.post(
        '$_baseUrl/${mess.conversationId}',
        formData: mess.toJson(),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> block(int blockedUserId) async {
    try {
      await AppHttpHelper.instance.post('blocks/$blockedUserId');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BlockedEntity>> getBlocks() async {
    try {
      final response = await AppHttpHelper.instance.get('blocks');
      return response.data
          .map<BlockedEntity>((e) => BlockedEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> unBlock(int blockedUserId) async {
    try {
      await AppHttpHelper.instance.delete('blocks/$blockedUserId/un-block');
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
