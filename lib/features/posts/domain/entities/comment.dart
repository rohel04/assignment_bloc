class Comments {
  dynamic post_id;
  final int id;
  final String name;
  final String email;
  final String body;

  Comments(
      {required this.post_id,
      required this.id,
      required this.name,
      required this.email,
      required this.body});
}
