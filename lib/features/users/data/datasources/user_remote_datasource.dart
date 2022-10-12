import 'dart:convert';

import 'package:assignment/core/errors/exception.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUserData();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImp({required this.client});
  @override
  Future<List<UserModel>> getAllUserData() async {
    List<UserModel> users = [];
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      data.forEach((element) {
        users.add(UserModel.fromJson(element));
      });
      return users;
    } else {
      throw ServerException();
    }
  }
}
