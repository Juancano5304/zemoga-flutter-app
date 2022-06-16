import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';

import '../../../testing_data/get_string.dart';
import 'post_list_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PostListRemoteDataSource dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = PostListRemoteDataSourceImpl(
        dio: mockDio, endpoint: 'https://jsonplaceholder.typicode.com/posts');
  });

  final decodedPostsJson = json.decode(
    getString('post_list.json'),
  );

  final testPostModel = PostModel.fromList(decodedPostsJson);

  test('Return a User when the response code is success 200', () async {
    when(
      mockDio.get('https://jsonplaceholder.typicode.com/posts'),
    ).thenAnswer(
      (_) async => Response(
        data: decodedPostsJson,
        requestOptions: RequestOptions(path: 'path'),
        statusCode: 200,
      ),
    );

    final result = await dataSource.getPostList();

    expect(result, equals(testPostModel));
  });
}
