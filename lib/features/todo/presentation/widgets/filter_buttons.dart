import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilterChip(
              label: const Text('All'),
              selected: state.filter == TodoFilter.all,
              onSelected: (_) {
                context.read<TodoBloc>().add(const FilterTodos(TodoFilter.all));
              },
            ),
            const SizedBox(width: 8),
            FilterChip(
              label: const Text('Active'),
              selected: state.filter == TodoFilter.active,
              onSelected: (_) {
                context.read<TodoBloc>().add(const FilterTodos(TodoFilter.active));
              },
            ),
            const SizedBox(width: 8),
            FilterChip(
              label: const Text('Completed'),
              selected: state.filter == TodoFilter.completed,
              onSelected: (_) {
                context.read<TodoBloc>().add(const FilterTodos(TodoFilter.completed));
              },
            ),
          ],
        );
      },
    );
  }
} 