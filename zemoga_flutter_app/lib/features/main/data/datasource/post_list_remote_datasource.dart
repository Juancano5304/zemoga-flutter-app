import 'dart:io';

import 'package:dio/dio.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';

abstract class PostListRemoteDataSource {
  Future<List<PostModel>>? getPostList();
}

class PostListRemoteDataSourceImpl implements PostListRemoteDataSource {
  PostListRemoteDataSourceImpl({
    required this.dio,
    required this.endpoint,
  });

  final Dio dio;
  final String endpoint;

  @override
  Future<List<PostModel>>? getPostList() async {
    final response = await dio.get(endpoint);
    if (response.statusCode == HttpStatus.ok) {
      return Future.value(PostModel.fromList(response.data));
    } else {
      throw ServerException();
    }
  }
}
