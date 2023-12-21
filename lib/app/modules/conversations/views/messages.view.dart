import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/conversations/controllers/messages.controller.dart';
import 'package:unidate/app/modules/dicoveries/views/widgets/swiper.widget.dart';

// ignore: constant_identifier_names
enum ChatMenuEnum { Block, Info }

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MessagesController>(
      init: Get.put(MessagesController()),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            shadowColor: AppColors.divider,
            title: _buildChatTitle(),
            actions: [
              IconButton(
                  onPressed: () {
                    final RenderBox button =
                        context.findRenderObject()! as RenderBox;
                    final RenderBox overlay = Navigator.of(context)
                        .overlay!
                        .context
                        .findRenderObject()! as RenderBox;
                    final Offset _offset = Offset(Get.width, 70);

                    final RelativeRect position = RelativeRect.fromRect(
                      Rect.fromPoints(
                        button.localToGlobal(_offset, ancestor: overlay),
                        button.localToGlobal(
                          button.size.bottomCenter(Offset.zero) + _offset,
                          ancestor: overlay,
                        ),
                      ),
                      Offset.zero & overlay.size,
                    );

                    showMenu(context: context, position: position, items: [
                      const PopupMenuItem(
                        child: Text('Block'),
                        value: ChatMenuEnum.Block,
                      ),
                      const PopupMenuItem(
                        child: Text('Info'),
                        value: ChatMenuEnum.Info,
                      ),
                    ]);
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.white,
                  )),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: controller.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.messages.isEmpty
                        ? const EmptyWidget(
                            message: 'No messages yet',
                          )
                        : SmartRefresher(
                            controller: controller.refreshController,
                            onRefresh: controller.getConversation,
                            enablePullDown: true,
                            enablePullUp: false,
                            header: const WaterDropHeader(),
                            child: ListView.builder(
                              itemCount: controller.messages.length,
                              itemBuilder: (context, index) {
                                final message = controller.messages[index];

                                bool isShowTime = index == 0 ||
                                    message.sendTime.difference(controller
                                            .messages[index - 1].sendTime) >
                                        const Duration(minutes: 5);

                                bool isJustSent = (index == 0 ||
                                        controller.messages[index - 1]
                                                .isYouSend ==
                                            message.isYouSend) &&
                                    !isShowTime;
                                return _buildMessage(
                                  controller.messages[index],
                                  isJustSent,
                                  isShowTime,
                                );
                              },
                            ),
                          ),
              ),
              Divider(
                color: AppColors.divider,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_outlined,
                      ),
                    ),
                    const HSpacer(8),
                    Expanded(
                      child: AppInput(
                        placeHolder: 'Type a message',
                        controller: controller.messageController,
                        focusNode: controller.focusNode,
                      ),
                    ),
                    const HSpacer(8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_outlined,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessage(
    MessageEntity e,
    bool isJustSent,
    bool isNeedInfo,
  ) {
    final isImage = e.text.isImageFileName;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        top: isNeedInfo ? 16 : 0,
      ),
      child: Column(
        children: [
          if (isNeedInfo) ...[
            Text(
              DateFormat('hh:mm a').format(e.sendTime),
              style: AppTextStyles.overline.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const VSpacer(8),
          ],
          Row(
            mainAxisAlignment:
                e.isYouSend ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!e.isYouSend) ...[
                if (!isJustSent) ...[
                  _buildAvatar(e),
                  const HSpacer(8),
                ] else ...[
                  const HSpacer(40),
                ],
              ],
              Container(
                padding: EdgeInsets.all(isImage ? 3 : 8),
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isImage
                    ? AppNetworkPicture(
                        e.text,
                        height: 200,
                        width: 200,
                      )
                    : Text(
                        e.text,
                        style: AppTextStyles.body2
                            .copyWith(color: AppColors.white),
                      ),
              ),
              if (e.isYouSend) ...[
                if (!isJustSent) ...[
                  const HSpacer(8),
                  _buildAvatar(e),
                ] else ...[
                  const HSpacer(40),
                ],
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(MessageEntity e) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: AppNetworkPicture(
        e.avatar,
        height: 32,
        width: 32,
      ),
    );
  }

  Widget _buildChatTitle() {
    return Row(
      children: [
        ClipOval(
          child: AppNetworkPicture(
            controller.conversation.avatar,
            height: 32,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              controller.conversation.title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.h6,
              maxLines: 1,
            ),
          ),
        )
      ],
    );
  }
}
