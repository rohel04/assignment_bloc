class Comment {
  final int post_id;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment(
      {required this.post_id,
      required this.id,
      required this.name,
      required this.email,
      required this.body});
}
