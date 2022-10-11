import 'dart:convert';

import 'package:assignment/core/errors/exception.dart';
import 'package:assignment/features/posts/data/models/post_model.dart';
import 'dart:io';

import 'package:http/http.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllPostFromLocal(File file);
  Future<void> cacheAllPostToLocal(List response, File file);
}

class PostLocalDataSourceimpl implements PostLocalDataSource {
  @override
  Future<void> cacheAllPostToLocal(List response, File file) async {
    var jsonResponse = jsonEncode(response);
    file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
  }

  @override
  Future<List<PostModel>> getAllPostFromLocal(File file) async {
    List<PostModel> posts = [];
    var jsonData = await file.readAsStringSync();
    // ignore: unnecessary_null_comparison
    if (jsonData != null) {
      List data = jsonDecode(jsonData);
      data.forEach((element) {
        posts.add(PostModel.fromJson(element));
      });
      print('From local');
      return posts;
    } else {
      throw CacheException();
    }
  }
}
