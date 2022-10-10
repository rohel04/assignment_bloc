import 'package:assignment/features/posts/data/models/post_model.dart';

abstract class PostLocalDataSource {
  Future<PostModel> getAllPostFromLocal();
  Future<void> cacheAllPostToLocal(Map<String, dynamic> json);
}

class PostLocalDataSourceimpl implements PostLocalDataSource {
  @override
  Future<void> cacheAllPostToLocal(Map<String, dynamic> json) {
    // TODO: implement cacheAllPostToLocal
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getAllPostFromLocal() {
    // TODO: implement getAllPostFromLocal
    throw UnimplementedError();
  }
}
