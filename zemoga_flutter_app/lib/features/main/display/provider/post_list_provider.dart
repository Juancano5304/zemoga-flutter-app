import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zemoga_flutter_app/core/config/endpoints.dart';
import 'package:zemoga_flutter_app/core/connection/network_info.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_local_data_source.dart';
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';
import 'package:zemoga_flutter_app/features/main/data/repositories/post_repository_impl.dart';

class PostListProvider extends ChangeNotifier {
  PostListProvider({
    this.failure,
    this.postsList,
  });

  static const endpointsAssetsPath = 'assets/config/endpoints.json';

  List<PostModel>? postsList;
  Failure? failure;

  Future<void> eitherFailureOrPostList() async {
    final configJson = Endpoints.fromJson(
      json.decode(
        (await rootBundle.loadString(
          endpointsAssetsPath,
        )),
      ),
    ).posts;
    PostRepositoryImpl repositoryImpl = PostRepositoryImpl(
      remoteDataSource: PostListRemoteDataSourceImpl(
        dio: Dio(),
        endpoint: configJson,
      ),
      localDataSource: PostListLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrPostList = await repositoryImpl.getPostsList();

    if (failureOrPostList == null) {
      failure = const ServerFailure(errorMessage: 'Empty Post List');
      return;
    }

    failureOrPostList.fold(
      (newFailure) {
        postsList = null;
        failure = newFailure;
        notifyListeners();
      },
      (newPostList) {
        postsList = newPostList;
        failure = null;
        notifyListeners();
      },
    );
  }

  Future<void> deletePostList() async {
    final configJson = Endpoints.fromJson(
      json.decode(
        (await rootBundle.loadString(
          endpointsAssetsPath,
        )),
      ),
    ).posts;

    PostRepositoryImpl repositoryImpl = PostRepositoryImpl(
      remoteDataSource: PostListRemoteDataSourceImpl(
        dio: Dio(),
        endpoint: configJson,
      ),
      localDataSource: PostListLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrSuccessDelete = await repositoryImpl.deletePostList();

    failureOrSuccessDelete.fold(
      (newFailure) {
        postsList = null;
        failure = newFailure;
        notifyListeners();
      },
      (_) {
        failure = null;
        postsList = null;
        notifyListeners();
      },
    );
  }

  Future<void> updateFavoritePost(PostModel post) async {
    final configJson = Endpoints.fromJson(
      json.decode(
        (await rootBundle.loadString(
          endpointsAssetsPath,
        )),
      ),
    ).posts;

    PostRepositoryImpl repositoryImpl = PostRepositoryImpl(
      remoteDataSource: PostListRemoteDataSourceImpl(
        dio: Dio(),
        endpoint: configJson,
      ),
      localDataSource: PostListLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrSuccessUpdate =
        await repositoryImpl.updateFavoritePost(post);

    failureOrSuccessUpdate.fold(
      (newFailure) {
        postsList = null;
        failure = newFailure;
        notifyListeners();
      },
      (newPostList) {
        failure = null;
        notifyListeners();
      },
    );
  }
}
