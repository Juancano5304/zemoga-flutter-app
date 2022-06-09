import 'package:dartz/dartz.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/core/usercases/usecases.dart';
import 'package:zemoga_flutter_app/features/main/domain/entities/post.dart';
import 'package:zemoga_flutter_app/features/main/domain/repositories/post_repository.dart';

class GetPosts {
  GetPosts({required PostRepository repository}) : _repository = repository;

  final PostRepository _repository;

  Future<Either<Failure, List<Post>?>?> call(
    NoParams params,
  ) async {
    return await _repository.getPostsList();
  }
}
