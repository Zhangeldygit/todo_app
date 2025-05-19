import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;
  final _uuid = const Uuid();

  TodoBloc(this.repository) : super(const TodoState()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodoStatus>(_onToggleTodoStatus);
    on<FilterTodos>(_onFilterTodos);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final todos = await repository.getTodos();
      emit(state.copyWith(todos: todos, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      final todo = Todo(
        id: _uuid.v4(),
        title: event.title,
      );
      await repository.addTodo(todo);
      final todos = await repository.getTodos();
      emit(state.copyWith(todos: todos));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      await repository.updateTodo(event.todo);
      final todos = await repository.getTodos();
      emit(state.copyWith(todos: todos));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await repository.deleteTodo(event.id);
      final todos = await repository.getTodos();
      emit(state.copyWith(todos: todos));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onToggleTodoStatus(
    ToggleTodoStatus event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await repository.toggleTodoStatus(event.id);
      final todos = await repository.getTodos();
      emit(state.copyWith(todos: todos));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void _onFilterTodos(FilterTodos event, Emitter<TodoState> emit) {
    emit(state.copyWith(filter: event.filter));
  }
} 