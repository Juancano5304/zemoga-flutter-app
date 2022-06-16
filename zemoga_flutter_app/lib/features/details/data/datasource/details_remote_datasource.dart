import 'dart:io';

import 'package:dio/dio.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/details/data/models/comment_model.dart';
import 'package:zemoga_flutter_app/features/details/data/models/user_model.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';

abstract class DetailsRemoteDataSource {
  Future<User>? getUser(int id);
  Future<List<Comment>>? getComments();
}

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  DetailsRemoteDataSourceImpl({
    required this.dio,
    required this.endpoint,
  });

  final Dio dio;
  final String endpoint;

  @override
  Future<List<Comment>>? getComments() async {
    final response = await dio.get(endpoint);
    if (response.statusCode == HttpStatus.ok) {
      return Future.value(CommentModel.fromList(response.data));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<User>? getUser(int id) async {
    final response = await dio.get(endpoint);
    if (response.statusCode == HttpStatus.ok) {
      final usersList = UserModel.fromList(response.data);
      final selectedUser = usersList?.firstWhere((user) => user.id == id);
      return Future.value(selectedUser);
    } else {
      throw ServerException();
    }
  }
}
