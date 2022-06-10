import 'package:zemoga_flutter_app/core/connection/network_info.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_local_data_source.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';
import 'package:zemoga_flutter_app/features/main/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final PostListRemoteDataSource remoteDataSource;
  final PostListLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<PostModel>?>?> getPostsList() async {
    final posts = await localDataSource.getCachedPostList();
    if (posts != null && posts.isNotEmpty) {
      return Right(posts);
    }
    if (await networkInfo.isConnected!) {
      try {
        final posts = await remoteDataSource.getPostList();
        localDataSource.cachePostList(posts);
        return Right(posts);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Exception from Server'));
      }
    } else {
      try {
        final posts = await localDataSource.getCachedPostList();
        return Right(posts);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'Exception from Cache'));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> updateFavoritePost(PostModel post) async {
    try {
      final response = await localDataSource.updateFavoritePost(post);
      return Right(response);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'Exception from Cache'));
    }
  }
}
