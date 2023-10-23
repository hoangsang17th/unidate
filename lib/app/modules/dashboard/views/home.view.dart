import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/widgets/match_card.widget.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView>
//     with SingleTickerProviderStateMixin {
//   List<Profile> draggableItems = [
//     Profile(
//         name: 'Rohini',
//         distance: '10 miles away',
//         imageAsset: AppAssets.images.users.user1.path),
//     Profile(
//         name: 'Rohini',
//         distance: '10 miles away',
//         imageAsset: AppAssets.images.users.user2.path),
//     Profile(
//         name: 'Rohini',
//         distance: '10 miles away',
//         imageAsset: AppAssets.images.users.user3.path),
//     Profile(
//         name: 'Rohini',
//         distance: '10 miles away',
//         imageAsset: AppAssets.images.users.user4.path),
//     Profile(
//         name: 'Rohini',
//         distance: '10 miles away',
//         imageAsset: AppAssets.images.users.user5.path),
//   ];

//   ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
//   late final AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         draggableItems.removeLast();
//         _animationController.reset();

//         swipeNotifier.value = Swipe.none;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ValueListenableBuilder(
//           valueListenable: swipeNotifier,
//           builder: (context, swipe, _) => Stack(
//             clipBehavior: Clip.none,
//             alignment: Alignment.center,
//             children: List.generate(draggableItems.length, (index) {
//               if (index == draggableItems.length - 1) {
//                 return PositionedTransition(
//                   rect: RelativeRectTween(
//                     begin: RelativeRect.fromSize(
//                         const Rect.fromLTWH(0, 0, 580, 340),
//                         const Size(580, 340)),
//                     end: RelativeRect.fromSize(
//                         Rect.fromLTWH(
//                             swipe != Swipe.none
//                                 ? swipe == Swipe.left
//                                     ? -300
//                                     : 300
//                                 : 0,
//                             0,
//                             580,
//                             340),
//                         const Size(580, 340)),
//                   ).animate(CurvedAnimation(
//                     parent: _animationController,
//                     curve: Curves.easeInOut,
//                   )),
//                   child: RotationTransition(
//                     turns: Tween<double>(
//                             begin: 0,
//                             end: swipe != Swipe.none
//                                 ? swipe == Swipe.left
//                                     ? -0.1 * 0.3
//                                     : 0.1 * 0.3
//                                 : 0.0)
//                         .animate(
//                       CurvedAnimation(
//                         parent: _animationController,
//                         curve: const Interval(0, 0.4, curve: Curves.easeInOut),
//                       ),
//                     ),
//                     child: DragWidget(
//                       profile: draggableItems[index],
//                       index: index,
//                       swipeNotifier: swipeNotifier,
//                       isLastCard: true,
//                     ),
//                   ),
//                 );
//               } else {
//                 return DragWidget(
//                   profile: draggableItems[index],
//                   index: index,
//                   swipeNotifier: swipeNotifier,
//                 );
//               }
//             }),
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           left: 0,
//           right: 0,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 46.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ActionButtonWidget(
//                   onPressed: () {
//                     swipeNotifier.value = Swipe.left;
//                     _animationController.forward();
//                   },
//                   icon: const Icon(
//                     Icons.close,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 ActionButtonWidget(
//                   onPressed: () {
//                     swipeNotifier.value = Swipe.right;
//                     _animationController.forward();
//                   },
//                   icon: const Icon(
//                     Icons.favorite,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           left: 0,
//           child: DragTarget<int>(
//             builder: (
//               BuildContext context,
//               List<dynamic> accepted,
//               List<dynamic> rejected,
//             ) {
//               return IgnorePointer(
//                 child: Container(
//                   height: 700.0,
//                   width: 80.0,
//                   color: Colors.transparent,
//                 ),
//               );
//             },
//             onAccept: (int index) {
//               setState(() {
//                 draggableItems.removeAt(index);
//               });
//             },
//           ),
//         ),
//         Positioned(
//           right: 0,
//           child: DragTarget<int>(
//             builder: (
//               BuildContext context,
//               List<dynamic> accepted,
//               List<dynamic> rejected,
//             ) {
//               return IgnorePointer(
//                 child: Container(
//                   height: 700.0,
//                   width: 80.0,
//                   color: Colors.transparent,
//                 ),
//               );
//             },
//             onAccept: (int index) {
//               setState(() {
//                 draggableItems.removeAt(index);
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ActionButtonWidget extends StatelessWidget {
//   const ActionButtonWidget(
//       {Key? key, required this.onPressed, required this.icon})
//       : super(key: key);
//   final VoidCallback onPressed;
//   final Icon icon;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       shape: const CircleBorder(),
//       child: Card(
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(35.0),
//         ),
//         child: IconButton(onPressed: onPressed, icon: icon),
//       ),
//     );
//   }
// }
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgPaper,
        elevation: 0,
        shadowColor: AppColors.divider,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Row(),
            Stack(
              children: [
                Draggable(
                  onDragEnd: (drag) {
                    // Khi kéo xong
                    // Like - dislike - none
                  },
                  onDragStarted: () {
                    // Khi kéo bắt đầu
                  },
                  childWhenDragging:
                      const Text('Hello'), // Hiển thị người tiếp theo
                  feedback:
                      const MatchCard(), // Gắn thêm label Like hoặc Dislike
                  child: const MatchCard(), // Hiển thị người hiện tại
                ),
                Positioned(
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: AppColors.bg,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: AppSvgPicture(
                            AppAssets.icons.like,
                            size: 32,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
