import 'package:dartz/dartz.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/core/usercases/usecases.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';
import 'package:zemoga_flutter_app/features/details/domain/repositories/details_repository.dart';

class GetDetails {
  GetDetails({required DetailsRepository repository})
      : _repository = repository;

  final DetailsRepository _repository;

  Future<Either<Failure, User?>?> callUser(
    int id,
  ) async {
    return await _repository.getUser(id);
  }

  Future<Either<Failure, List<Comment>?>?> callComments(
    NoParams params,
  ) async {
    return await _repository.getComments();
  }
}
