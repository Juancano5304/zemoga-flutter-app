import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.errorMessage});

  final String? errorMessage;
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
