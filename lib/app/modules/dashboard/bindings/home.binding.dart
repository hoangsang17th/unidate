import 'package:get/get.dart';

import '../../../data/datasources/todo.datasource.dart';
import '../../../data/repositories/todo.repository.dart';
import '../controllers/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        todoRepository: TodoRepository(
          todoDataSource: TodoDataSource(),
        ),
      ),
    );
  }
}
