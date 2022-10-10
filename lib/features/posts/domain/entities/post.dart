import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int user_id;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.user_id,
      required this.id,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [user_id, id, title, body];
}
