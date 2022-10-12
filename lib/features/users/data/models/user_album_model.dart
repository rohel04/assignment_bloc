import 'package:assignment/features/users/domain/entities/album.dart';

class AlbumModel extends Album {
  AlbumModel({required super.id, required super.title, required super.user_id});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        id: json['id'], title: json['title'], user_id: json['user_id']);
  }
}
