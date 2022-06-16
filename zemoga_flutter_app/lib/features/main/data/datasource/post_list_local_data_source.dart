import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';

const cachedPostList = 'CACHED_POST_LIST';

abstract class PostListLocalDataSource {
  Future<void> cachePostList(List<PostModel>? modelToCache);
  Future<void> deletePostList();
  Future<List<PostModel>?> getCachedPostList();
  Future<bool> updateFavoritePost(PostModel post);
}

class PostListLocalDataSourceImpl implements PostListLocalDataSource {
  PostListLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> cachePostList(List<PostModel>? modelToCache) {
    if (modelToCache != null) {
      return _sharedPreferences.setString(
        cachedPostList,
        json.encode(
          modelToCache.toList(),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> deletePostList() async {
    final jsonString = _sharedPreferences.getString(cachedPostList);
    if (jsonString != null) {
      _sharedPreferences.remove(cachedPostList);
    }
  }

  @override
  Future<List<PostModel>?> getCachedPostList() async {
    final jsonString = _sharedPreferences.getString(cachedPostList);
    if (jsonString != null) {
      return Future.value(PostModel.fromList(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> updateFavoritePost(PostModel postModel) async {
    final jsonString = _sharedPreferences.getString(cachedPostList);
    if (jsonString != null) {
      final postsList = PostModel.fromList(json.decode(jsonString))!;
      postsList.singleWhere((element) => element == postModel).isFavorite =
          postModel.isFavorite;
      return Future.value(true);
    } else {
      throw CacheException();
    }
  }
}
