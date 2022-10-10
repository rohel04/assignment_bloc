import 'package:assignment/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel(
      {required super.user_id,
      required super.id,
      required super.title,
      required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        user_id: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {'user_id': user_id, 'id': id, 'title': title, 'body': body};
  }
}
