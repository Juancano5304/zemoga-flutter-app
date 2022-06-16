import 'package:flutter_test/flutter_test.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';

void main() {
  const testuserModel = User(
    email: 'email',
    id: 1,
    name: 'name',
    phone: 'phone',
    username: 'username',
    website: 'website',
  );
  test('Expect a json with the good data', () {
    final expectedMap = {
      'email': 'email',
      'id': 1,
      'name': 'name',
      'phone': 'phone',
      'username': 'username',
      'website': 'website',
    };

    final result = testuserModel.toJson();

    expect(result, expectedMap);
  });
}
