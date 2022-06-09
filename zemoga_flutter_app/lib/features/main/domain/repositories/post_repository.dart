import 'package:dartz/dartz.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/features/main/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>?>?> getPostsList();
}
