import 'package:assignment/features/posts/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel(
      {required super.post_id,
      required super.id,
      required super.name,
      required super.email,
      required super.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        post_id: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }
}
