import 'package:zemoga_flutter_app/core/connection/network_info.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/details/data/datasource/details_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';
import 'package:zemoga_flutter_app/features/details/domain/repositories/details_repository.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  DetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  final DetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Comment>?>?> getComments() async {
    if (await networkInfo.isConnected!) {
      try {
        final comments = await remoteDataSource.getComments();
        return Right(comments);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Exception from Server'));
      }
    } else {
      return Left(
        NetworkFailure(errorMessage: 'Exception from network connectivity'),
      );
    }
  }

  @override
  Future<Either<Failure, User?>?> getUser(int id) async {
    if (await networkInfo.isConnected!) {
      try {
        final user = await remoteDataSource.getUser(id);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Exception from Server'));
      }
    } else {
      return Left(
        NetworkFailure(errorMessage: 'Exception from network connectivity'),
      );
    }
  }
}
