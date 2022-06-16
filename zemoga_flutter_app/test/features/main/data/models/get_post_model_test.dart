import 'package:flutter_test/flutter_test.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';

void main() {
  final testPostModel = PostModel(
    body: 'body',
    id: 1,
    title: 'title',
    userId: 1,
  );

  test('Expect a json with the good data', () async {
    final expectedMap = {
      'body': 'body',
      'id': 1,
      'isFavorite': null,
      'title': 'title',
      'userId': 1,
    };

    final result = testPostModel.toJson();

    expect(result, expectedMap);
  });
}
