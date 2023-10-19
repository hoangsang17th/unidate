import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/values/string.dart';

import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppString.appName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    // InkWell(
                    //   onTap: () =>
                    //       controller.onComplete(controller.todos[index].id!),
                    //   child: controller.todos[index].isCompleted
                    //       ? SvgPicture.asset(
                    //           "assets/icons/check-square.svg",
                    //           color: const Color(0xFF2ECC71),
                    //         )
                    //       : SvgPicture.asset("assets/icons/square.svg"),
                    // ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        controller.todos[index].name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     controller.todoNameController.text =
                    //         controller.todos[index].name;
                    //     Get.bottomSheet(
                    //       TodoBottomSheet(
                    //         id: controller.todos[index].id,
                    //         isUpdate: true,
                    //       ),
                    //     ).whenComplete(() {
                    //       controller.todoNameController.text = "";
                    //       controller.isSave.value = false;
                    //     });
                    //   },
                    // child: SvgPicture.asset("assets/icons/edit.svg"),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.bottomSheet(
            const TodoBottomSheet(),
          ).whenComplete(() {
            controller.todoNameController.text = "";
            controller.isSave.value = false;
          }),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TodoBottomSheet extends GetView<HomeController> {
  const TodoBottomSheet({
    Key? key,
    this.isUpdate = false,
    this.id,
  }) : super(key: key);
  final bool isUpdate;
  final int? id;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset("assets/icons/x.svg"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      isUpdate ? "Update Todo Name" : "Add New Todo",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: () => isUpdate
                        ? controller.onUpdate(id!)
                        : controller.onCreate(),
                    child: SvgPicture.asset(
                      "assets/icons/check.svg",
                      color: controller.isSave.value
                          ? const Color(0xFF2ECC71)
                          : const Color(0xFFE74C3C),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.todoNameController,
              onChanged: (value) => controller.onChangeTextField(value),
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                  gapPadding: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
