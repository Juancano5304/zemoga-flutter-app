import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zemoga_flutter_app/core/error/exceptions.dart';
import 'package:zemoga_flutter_app/features/posts_list/data/models/post_model.dart';

const cachedPostList = 'CACHED_POST_LIST';

abstract class PostListLocalDataSource {
  Future<void> cachePostList(List<PostModel>? modelToCache);
  Future<List<PostModel>?> getCachedPostList();
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
  Future<List<PostModel>?> getCachedPostList() async {
    final jsonString = _sharedPreferences.getString(cachedPostList);
    if (jsonString != null) {
      Future.value(PostModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
    return null;
  }
}
