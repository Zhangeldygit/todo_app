import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_state.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(child: Text(state.error!));
        }

        if (state.filteredTodos.isEmpty) {
          return const Center(
            child: Text(
              'No todos yet. Add one!',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          itemCount: state.filteredTodos.length,
          itemBuilder: (context, index) {
            final todo = state.filteredTodos[index];
            return TodoItem(todo: todo);
          },
        );
      },
    );
  }
} 