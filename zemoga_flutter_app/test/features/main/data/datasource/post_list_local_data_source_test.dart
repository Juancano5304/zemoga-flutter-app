import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_local_data_source.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';

import '../../../testing_data/get_string.dart';
import 'post_list_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late PostListLocalDataSource dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        PostListLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  final testPostsModel = PostModel.fromList(
    json.decode(
      getString('post_list.json'),
    ),
  );

  test('Return Post List from Cache SharedPreferences', () async {
    when(mockSharedPreferences.getString(cachedPostList))
        .thenReturn(getString('post_list.json'));
    final result = await dataSource.getCachedPostList();

    verify(mockSharedPreferences.getString(cachedPostList));
    expect(result, equals(testPostsModel));
  });
}
