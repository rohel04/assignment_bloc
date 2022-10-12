import 'dart:convert';

import 'package:assignment/features/users/data/models/user_model.dart';
import 'package:assignment/features/users/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tUserModel = UserModel(
      id: 1,
      name: "Leanne Graham",
      username: "Bret",
      email: "Sincere@april.biz",
      address: {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"},
      },
      phone: "1-770-736-8031 x56442",
      website: "hildegard.org",
      company: {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      });

  test("should be sub type of User", () {
    expect(tUserModel, isA<User>());
  });

  group('jsonMap', () {
    test('should return UserModel', () {
      Map<String, dynamic> jsonMap = jsonDecode(fixture('user.json'));
      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });
  });
}
