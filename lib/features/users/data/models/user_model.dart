import 'package:assignment/features/users/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.name,
      required super.username,
      required super.email,
      required super.address,
      required super.phone,
      required super.website,
      required super.company});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: json['address'],
        phone: json['phone'],
        website: json['website'],
        company: json['company']);
  }
}
