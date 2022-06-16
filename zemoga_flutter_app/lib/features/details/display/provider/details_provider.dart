import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:zemoga_flutter_app/core/config/endpoints.dart';
import 'package:zemoga_flutter_app/core/connection/network_info.dart';
import 'package:zemoga_flutter_app/core/error/failure.dart';
import 'package:zemoga_flutter_app/features/details/data/datasource/details_remote_datasource.dart';
import 'package:zemoga_flutter_app/features/details/data/repositories/details_repository_impl.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';

class DetailsProvider extends ChangeNotifier {
  DetailsProvider({
    this.failure,
    this.commentsList,
    this.user,
  });

  static const endpointsAssetsPath = 'assets/config/endpoints.json';

  int? id;

  List<Comment>? commentsList;
  Failure? failure;
  User? user;

  Future<void> eitherFailureOrCommentsList(int postId) async {
    final configJson = Endpoints.fromJson(
      json.decode(
        (await rootBundle.loadString(
          endpointsAssetsPath,
        )),
      ),
    ).comments;
    DetailsRepositoryImpl repositoryImpl = DetailsRepositoryImpl(
      remoteDataSource:
          DetailsRemoteDataSourceImpl(dio: Dio(), endpoint: configJson),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrCommentsList = await repositoryImpl.getComments();

    if (failureOrCommentsList == null) {
      failure = ServerFailure(errorMessage: 'Empty Comments List');
      return;
    }

    failureOrCommentsList.fold(
      (newFailure) {
        commentsList = null;
        failure = newFailure;
        notifyListeners();
      },
      (newCommentsList) {
        final filteredCommentsList = newCommentsList
            ?.where((comment) => comment.postId == postId)
            .toList();
        if (filteredCommentsList == null || filteredCommentsList.isEmpty) {
          failure = ServerFailure(errorMessage: 'User not found on list');
          commentsList = null;
          notifyListeners();
        } else {
          commentsList = filteredCommentsList;
          failure = null;
          notifyListeners();
        }
      },
    );
  }

  Future<void> eitherFailureOrUser(int id) async {
    final configJson = Endpoints.fromJson(
      json.decode(
        (await rootBundle.loadString(
          endpointsAssetsPath,
        )),
      ),
    ).users;
    DetailsRepositoryImpl repositoryImpl = DetailsRepositoryImpl(
      remoteDataSource: DetailsRemoteDataSourceImpl(
        dio: Dio(),
        endpoint: configJson,
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrUser = await repositoryImpl.getUser(id);

    if (failureOrUser == null) {
      failure = ServerFailure(errorMessage: 'User not found');
      return;
    }

    failureOrUser.fold(
      (newFailure) {
        commentsList = null;
        failure = newFailure;
        notifyListeners();
      },
      (newUser) {
        user = newUser;
        failure = null;
        notifyListeners();
      },
    );
  }
}
