import 'package:dartz/dartz.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';

abstract class DetailsRepository {
  Future<Either<Failure, User?>?> getUser(int id);

  Future<Either<Failure, List<Comment>?>?> getComments();
}
