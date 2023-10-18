import '../models/todo.model.dart';

class TodoDataSource {
  Future<List<TodoModel>> getTodos() async {
    return TodoMock.todos;
  }

  Future<bool> updateTodo(int id, String name) async {
    TodoModel data = TodoMock.todos.firstWhere((element) => element.id == id);
    data.name = name;
    return true;
  }

  Future<bool> completeTodo(int id) async {
    TodoModel data = TodoMock.todos.firstWhere(
      (element) => element.id == id,
    );
    data.isCompleted = !data.isCompleted;
    return true;
  }

  Future<bool> createTodo(TodoModel todo) async {
    todo.id = TodoMock.todos.length;
    TodoMock.todos.add(todo);
    return true;
  }
}

class TodoMock {
  // Here you can use storage plans like hive to store data on user's device
  static List<TodoModel> todos = [
    TodoModel(
      id: 0,
      name: "Welcome to Flutter",
      isCompleted: true,
      creatAt: DateTime.now().subtract(
        const Duration(days: 3),
      ),
    ),
    TodoModel(
      id: 1,
      name: "This is a new project",
      isCompleted: true,
      creatAt: DateTime.now().subtract(
        const Duration(days: 2),
      ),
    ),
    TodoModel(
      id: 2,
      name: "And I want you learning GetX Pattern",
      isCompleted: true,
      creatAt: DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ),
    TodoModel(
      id: 3,
      name: "Find out about it and apply it now",
      isCompleted: false,
      creatAt: DateTime.now(),
    ),
  ];
}
