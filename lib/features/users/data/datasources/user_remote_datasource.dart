import 'dart:convert';

import 'package:assignment/core/errors/exception.dart';
import 'package:assignment/features/posts/data/models/post_model.dart';

import '../../../posts/domain/entities/post.dart';
import '../../domain/entities/album.dart';
import '../../domain/entities/todo.dart';
import '../models/user_album_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

import '../models/user_todo_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUserData();
  Future<List<PostModel>> getUserPostsData(int id);
  Future<List<TodoModel>> getUserTodosData(int id);
  Future<List<AlbumModel>> getUserAlbumsData(int id);
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

  @override
  Future<List<AlbumModel>> getUserAlbumsData(int id) async {
    List<AlbumModel> albums = [];
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$id/albums'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      data.forEach((element) {
        albums.add(AlbumModel.fromJson(element));
      });
      return albums;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getUserPostsData(int id) async {
    List<PostModel> posts = [];
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$id/posts'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      data.forEach((element) {
        posts.add(PostModel.fromJson(element));
      });
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoModel>> getUserTodosData(int id) async {
    List<TodoModel> todos = [];
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$id/todos'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      data.forEach((element) {
        todos.add(TodoModel.fromJson(element));
      });
      return todos;
    } else {
      throw ServerException();
    }
  }
}
