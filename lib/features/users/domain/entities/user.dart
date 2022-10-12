import 'package:equatable/equatable.dart';

class User extends Equatable {
  dynamic id;
  dynamic name;
  dynamic username;
  dynamic email;
  dynamic address;
  dynamic phone;
  dynamic website;
  dynamic company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory User.fromMap(Map data) {
    return User(
        id: data['id'],
        name: data['name'],
        username: data['username'],
        email: data['email'],
        address: data['address'],
        phone: data['phone'],
        website: data['website'],
        company: data['company']);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}
