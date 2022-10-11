import 'dart:convert';

import 'package:assignment/core/errors/exception.dart';
import 'package:assignment/features/posts/data/models/comment_model.dart';
import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:http/http.dart';

import '../models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPostData();
  Future<PostModel> getPostDetailData(int id);
  Future<List<CommentModel>> getPostCommentsData(int id);
  Future<Comments> addPostComments(
      int id, int postId, String name, String email, String body);
}

class PostRemoteDataSourceImp implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImp({required this.client});

  @override
  Future<List<PostModel>> getAllPostData() async {
    List<PostModel> posts = [];
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      data.forEach((element) {
        posts.add(PostModel.fromJson(element));
      });
      print('From server');
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CommentModel>> getPostCommentsData(int id) async {
    List<CommentModel> comments = [];
    final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id/comments'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      data.forEach((element) {
        comments.add(CommentModel.fromJson(element));
      });
      return comments;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPostDetailData(int id) async {
    final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Comments> addPostComments(
      int id, int postId, String name, String email, String body) async {
    final response = await post(
        Uri.parse(
            'https://jsonplaceholder.typicode.com/posts/$postId/comments'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, dynamic>{
          'postId': postId,
          'id': id,
          'name': name,
          'email': email,
          'body': body
        }));
    if (response.statusCode == 201) {
      return CommentModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
