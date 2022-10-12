import 'package:equatable/equatable.dart';

class Post extends Equatable {
  dynamic user_id;
  dynamic id;
  dynamic title;
  dynamic body;

  Post(
      {required this.user_id,
      required this.id,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [user_id, id, title, body];
}
