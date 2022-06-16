import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zemoga_flutter_app/core/connection/network_info.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_local_data_source.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';
import 'package:zemoga_flutter_app/features/main/data/repositories/post_repository_impl.dart';
import 'package:zemoga_flutter_app/features/main/domain/entities/post.dart';

import 'post_list_repository_impl_test.mocks.dart';

@GenerateMocks([
  PostListLocalDataSource,
  PostListRemoteDataSource,
  NetworkInfo,
])
void main() {
  late PostRepositoryImpl repositoryImpl;
  late MockPostListLocalDataSource mockPostListLocalDataSource;
  late MockPostListRemoteDataSource mockPostListRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockPostListRemoteDataSource = MockPostListRemoteDataSource();
    mockPostListLocalDataSource = MockPostListLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = PostRepositoryImpl(
      remoteDataSource: mockPostListRemoteDataSource,
      localDataSource: mockPostListLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final testPostListModel = [
    PostModel(
      body: 'body',
      id: 1,
      title: 'title',
      userId: 1,
    ),
    PostModel(
      body: 'body 2',
      id: 2,
      title: 'title 2',
      userId: 2,
    ),
  ];

  final List<Post> testPostList = testPostListModel;

  group(
    'When Internet is active',
    () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });

      test('When internet is active, return a success Post List', () async {
        when(mockPostListRemoteDataSource.getPostList())
            .thenAnswer((realInvocation) async => testPostListModel);

        final result = await repositoryImpl.getPostsList();

        expect(result, equals(Right(testPostList)));
      });

      test(
        'When internet is active, return a server exception from remote datasource',
        () async {
          when(mockPostListRemoteDataSource.getPostList())
              .thenThrow(ServerException());

          final result = await repositoryImpl.getPostsList();

          expect(
            result,
            equals(
              const Left(
                ServerFailure(errorMessage: 'Exception from Server'),
              ),
            ),
          );
        },
      );
    },
  );

  group('When Internet is not available', () {
    setUp(() {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
    });

    test(
        'When internet is not available, return cached post list from local datasource',
        () async {
      when(mockPostListLocalDataSource.getCachedPostList())
          .thenAnswer((realInvocation) async => testPostListModel);

      final result = await repositoryImpl.getPostsList();

      expect(result, equals(Right(testPostList)));
    });

    test(
        'When internet is not available, return Cached Exception from local datasource',
        () async {
      when(mockPostListLocalDataSource.getCachedPostList())
          .thenThrow(CacheException());

      final result = await repositoryImpl.getPostsList();

      expect(
          result,
          equals(
              const Left(CacheFailure(errorMessage: 'Exception from Cache'))));
    });
  });
}
