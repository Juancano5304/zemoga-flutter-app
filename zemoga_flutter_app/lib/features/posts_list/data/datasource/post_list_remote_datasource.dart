import 'dart:io';

import 'package:dio/dio.dart';
import 'package:zemoga_flutter_app/core/config/endpoints.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/posts_list/data/models/post_model.dart';

abstract class PostListRemoteDataSource {
  Future<List<PostModel>>? getPostList();
}

class PostListRemoteDataSourceImpl implements PostListRemoteDataSource {
  PostListRemoteDataSourceImpl({
    required this.dio,
    required this.endpoints,
  });

  final Dio dio;
  final Endpoints endpoints;

  @override
  Future<List<PostModel>>? getPostList() async {
    final response = await dio.get(endpoints.posts);
    if (response.statusCode == HttpStatus.ok) {
      return Future.value(PostModel.fromList(response.data));
    } else {
      throw ServerException();
    }
  }
}
