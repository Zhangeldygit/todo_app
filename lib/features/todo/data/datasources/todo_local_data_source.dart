import 'package:hive/hive.dart';
import '../models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
  Future<void> toggleTodoStatus(String id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Box<TodoModel> todoBox;

  TodoLocalDataSourceImpl(this.todoBox);

  @override
  Future<List<TodoModel>> getTodos() async {
    return todoBox.values.toList();
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    await todoBox.put(todo.id, todo);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await todoBox.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await todoBox.delete(id);
  }

  @override
  Future<void> toggleTodoStatus(String id) async {
    final todo = todoBox.get(id);
    if (todo != null) {
      await todoBox.put(id, todo.copyWith(isCompleted: !todo.isCompleted));
    }
  }
} 