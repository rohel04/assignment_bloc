import 'dart:convert';

import 'package:assignment/features/posts/data/models/post_model.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tpostModel =
      PostModel(user_id: 1, id: 1, title: 'Test title', body: 'Test body');

  test('should be sub class of Post Model', () async {
    expect(tpostModel, isA<Post>());
  });

  group('fromJson', () {
    test('should return Post Model', () {
      Map<String, dynamic> jsonMap = jsonDecode(fixture('post.json'));
      final result = PostModel.fromJson(jsonMap);

      expect(result, tpostModel);
    });
  });
}
