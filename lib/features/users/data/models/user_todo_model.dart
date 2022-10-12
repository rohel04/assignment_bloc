import 'package:assignment/features/users/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel(
      {required super.user_id,
      required super.id,
      required super.completed,
      required super.title});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        user_id: json['user_id'],
        id: json['id'],
        completed: json['completed'],
        title: json['title']);
  }
}
