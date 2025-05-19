import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';
import 'todo_event.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoFilter filter;
  final bool isLoading;
  final String? error;

  const TodoState({
    this.todos = const [],
    this.filter = TodoFilter.all,
    this.isLoading = false,
    this.error,
  });

  List<Todo> get filteredTodos {
    switch (filter) {
      case TodoFilter.completed:
        return todos.where((todo) => todo.isCompleted).toList();
      case TodoFilter.active:
        return todos.where((todo) => !todo.isCompleted).toList();
      case TodoFilter.all:
        return todos;
    }
  }

  TodoState copyWith({
    List<Todo>? todos,
    TodoFilter? filter,
    bool? isLoading,
    String? error,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [todos, filter, isLoading, error];
} 