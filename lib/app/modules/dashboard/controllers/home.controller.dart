import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/todo.model.dart';
import '../../../data/repositories/todo.repository.dart';

class HomeController extends GetxController {
  final TodoRepository todoRepository;
  HomeController({
    required this.todoRepository,
  });

  RxList<TodoModel> todos = <TodoModel>[].obs;
  RxBool isSave = false.obs;
  TextEditingController todoNameController = TextEditingController();
  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  Future<void> getTodos() async {
    todos.value = await todoRepository.getTodos();
    // I used refresh() function for UI update
    todos.refresh();
  }

  Future<void> onComplete(int id) async {
    await todoRepository.completeTodo(id);
    getTodos();
  }

  void onUpdate(int id) async {
    await todoRepository.updateTodo(id, todoNameController.text);
    getTodos();
    Get.back();
  }

  void onChangeTextField(String value) {
    if (value != "") {
      isSave.value = true;
    } else {
      isSave.value = false;
    }
  }

  Future<void> onCreate() async {
    await todoRepository.createTodo(
      TodoModel(
        name: todoNameController.text,
        isCompleted: false,
        creatAt: DateTime.now(),
      ),
    );
    getTodos();
    Get.back();
  }
}
