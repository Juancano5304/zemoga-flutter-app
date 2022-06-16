import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zemoga_flutter_app/features/details/data/datasource/details_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/details/data/models/comment_model.dart';
import 'package:zemoga_flutter_app/features/details/data/models/user_model.dart';

import '../../../testing_data/get_string.dart';
import 'details_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late DetailsRemoteDataSource dataSource;

  setUp(() {
    mockDio = MockDio();
  });

  final decodedUserJson = json.decode(
    getString('user.json'),
  );

  final testUserModel = UserModel.fromList(decodedUserJson);

  test('Return a User when the response code is success 200', () async {
    dataSource = DetailsRemoteDataSourceImpl(
        dio: mockDio, endpoint: 'https://jsonplaceholder.typicode.com/users');
    when(
      mockDio.get('https://jsonplaceholder.typicode.com/users'),
    ).thenAnswer(
      (_) async => Response(
        data: decodedUserJson,
        requestOptions: RequestOptions(path: 'path'),
        statusCode: 200,
      ),
    );

    final result = await dataSource.getUser(1);

    expect(result, equals(testUserModel!.first));
  });

  final decodedCommentsJson = json.decode(
    getString('comment_list.json'),
  );

  final testCommentsModel = CommentModel.fromList(decodedCommentsJson);

  test('Return a Comments List when the response code is success 200',
      () async {
    dataSource = DetailsRemoteDataSourceImpl(
        dio: mockDio,
        endpoint: 'https://jsonplaceholder.typicode.com/comments');
    when(
      mockDio.get('https://jsonplaceholder.typicode.com/comments'),
    ).thenAnswer(
      (_) async => Response(
        data: decodedCommentsJson,
        requestOptions: RequestOptions(path: 'path'),
        statusCode: 200,
      ),
    );

    final result = await dataSource.getComments();

    expect(result, equals(testCommentsModel));
  });
}
