import 'dart:convert';
import 'dart:io';

import 'package:assignment/core/errors/exception.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getAllUsersFromLocal(File file);
  Future<void> cacheAllUsersToLocal(List response, File file);
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  @override
  Future<void> cacheAllUsersToLocal(List response, File file) async {
    print('Local caching');
    var jsonResponse = jsonEncode(response);
    print(jsonResponse);
    file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
  }

  @override
  Future<List<UserModel>> getAllUsersFromLocal(File file) async {
    List<UserModel> users = [];
    if (file.existsSync()) {
      var jsonData = await file.readAsStringSync();
      List data = jsonDecode(jsonData);
      data.forEach((element) {
        users.add(UserModel.fromJson(element));
      });
      print('From local');
      return users;
    } else {
      throw CacheException();
    }
  }
}
