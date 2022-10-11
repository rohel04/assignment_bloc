import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final dynamic user_id;
  final dynamic id;
  final dynamic title;
  final dynamic body;

  Post(
      {required this.user_id,
      required this.id,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [user_id, id, title, body];
}
