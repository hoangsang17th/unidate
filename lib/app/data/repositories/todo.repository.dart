import '../datasources/todo.datasource.dart';
import '../models/todo.model.dart';

class TodoRepository {
  final TodoDataSource todoDataSource;
  // If you get data from an API you must use Provider
  TodoRepository({
    required this.todoDataSource,
  });

  Future<List<TodoModel>> getTodos() async {
    return await todoDataSource.getTodos();
  }

  Future<bool> updateTodo(int id, String name) async {
    return await todoDataSource.updateTodo(id, name);
  }

  Future<bool> completeTodo(int id) async {
    return await todoDataSource.completeTodo(id);
  }

  Future<bool> createTodo(TodoModel todo) async {
    return await todoDataSource.createTodo(todo);
  }
}
