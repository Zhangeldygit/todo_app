import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final todoModels = await localDataSource.getTodos();
    return todoModels;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    await localDataSource.addTodo(todoModel);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    await localDataSource.updateTodo(todoModel);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await localDataSource.deleteTodo(id);
  }

  @override
  Future<void> toggleTodoStatus(String id) async {
    await localDataSource.toggleTodoStatus(id);
  }
} 