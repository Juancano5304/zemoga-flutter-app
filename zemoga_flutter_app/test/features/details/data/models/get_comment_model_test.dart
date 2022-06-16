import 'package:flutter_test/flutter_test.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';

void main() {
  const testCommentModel = Comment(
    body: 'body',
    email: 'email',
    id: 1,
    name: 'name',
    postId: 1,
  );

  test('Expect a json with the good data', () {
    final expectedMap = {
      'body': 'body',
      'email': 'email',
      'id': 1,
      'name': 'name',
      'postId': 1,
    };

    final result = testCommentModel.toJson();

    expect(result, expectedMap);
  });
}
