import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/modules/conversations/controllers/conversation.controller.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/conversations/providers/conversation.provider.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';

class MessagesController extends GetxController {
  static MessagesController get to => Get.find();

  final ConversationProvider _conversationProvider = ConversationProvider();

  final RxList<MessageEntity> _messages = <MessageEntity>[].obs;
  List<MessageEntity> get messages => _messages;

  RxBool isLoading = true.obs;

  final Rxn<ConversationEntity> _conversation = Rxn<ConversationEntity>();
  ConversationEntity get conversation => _conversation.value!;

  int get conversationId => conversation.id;

  final RefreshController refreshController = RefreshController();
  final ScrollController scrollController = ScrollController();

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
      onChangedMessage(data[1]);
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
    if (messages.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      });
    }
  }

  void onChangedMessage(String message) {
    messageController.text = message;
  }

  Future<void> onSendImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.media,
    );

    if (result != null) {
      final path = result.files.single.path!;
      final image = await MultipartFile.fromFile(
        path,
        contentType: MediaType.parse(
          lookupMimeType(path).toString(),
        ),
      );

      final res = await _conversationProvider.chat(ChatMessageEntity(
        conversationId: conversationId,
        image: image,
      ));
      final message = MessageEntity(
        id: 0,
        text: res!,
        avatar: DashBoardController.to.user!.avatar,
        sendTime: DateTime.now(),
        isYouSend: true,
      ); // Tại sao lại đợi 1s => Do R2 lúc lưu ảnh chưa apply được policy mà phải mất 1 lát thì mới được
      await Future.delayed(const Duration(seconds: 1));
      _messages.add(message);
      onScrollToBottom();
    } else {
      Get.snackbar('Warning', 'No image selected');
    }
  }

  Future<void> onSendMessage() async {
    if (messageController.text.isEmpty) return;
    final message = MessageEntity(
      id: 0,
      text: messageController.text,
      avatar: DashBoardController.to.user!.avatar,
      sendTime: DateTime.now(),
      isYouSend: true,
    );
    await _conversationProvider.chat(ChatMessageEntity(
      conversationId: conversationId,
      text: messageController.text,
    ));

    _messages.add(message);
    messageController.clear();
    onScrollToBottom();
    // try {
    //   await _conversationProvider.sendMessage(conversationId, message.text);
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }

  void onWsMessage(MessageEntity message) {
    if (message.conversationId == conversationId) {
      _messages.add(message);
      onScrollToBottom();
    }
  }

  void onScrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  Future<void> onBlocking() async {
    try {
      await _conversationProvider.block(conversation.partnerId);
      ConversationController.to.onRemoveConversation(conversation.partnerId);
      Get.back();
    } catch (e) {
      debugPrint('Lỗi block');
    }
  }
}
