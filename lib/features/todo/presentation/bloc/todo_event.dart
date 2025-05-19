import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  const AddTodo(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  const UpdateTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final String id;

  const DeleteTodo(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleTodoStatus extends TodoEvent {
  final String id;

  const ToggleTodoStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class FilterTodos extends TodoEvent {
  final TodoFilter filter;

  const FilterTodos(this.filter);

  @override
  List<Object?> get props => [filter];
}

enum TodoFilter { all, completed, active } 