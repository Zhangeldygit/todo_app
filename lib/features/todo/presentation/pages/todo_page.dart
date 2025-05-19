import 'package:flutter/material.dart';


import '../widgets/add_todo.dart';
import '../widgets/filter_buttons.dart';
import '../widgets/todo_list.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: const Column(
        children:  [
          AddTodo(),
          FilterButtons(),
          Expanded(
            child: TodoList(),
          ),
        ],
      ),
    );
  }
} 