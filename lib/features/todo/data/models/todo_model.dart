import 'package:hive/hive.dart';
import '../../domain/entities/todo.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends Todo {
  @override
  @HiveField(0)
  String get id => super.id;
  
  @override
  @HiveField(1)
  String get title => super.title;
  
  @override
  @HiveField(2)
  bool get isCompleted => super.isCompleted;

  const TodoModel({
    required String id,
    required String title,
    bool isCompleted = false,
  }) : super(
          id: id,
          title: title,
          isCompleted: isCompleted,
        );

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
  }

  @override
  TodoModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
} 