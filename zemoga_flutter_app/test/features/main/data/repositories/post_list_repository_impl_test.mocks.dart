// Mocks generated by Mockito 5.2.0 from annotations
// in zemoga_flutter_app/test/features/main/data/repositories/post_list_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:zemoga_flutter_app/core/connection/network_info.dart' as _i6;
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_local_data_source.dart'
    as _i2;
import 'package:zemoga_flutter_app/features/main/data/datasource/post_list_remote_datasource.dart'
    as _i5;
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [PostListLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostListLocalDataSource extends _i1.Mock
    implements _i2.PostListLocalDataSource {
  MockPostListLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> cachePostList(List<_i4.PostModel>? modelToCache) =>
      (super.noSuchMethod(Invocation.method(#cachePostList, [modelToCache]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<List<_i4.PostModel>?> getCachedPostList() =>
      (super.noSuchMethod(Invocation.method(#getCachedPostList, []),
              returnValue: Future<List<_i4.PostModel>?>.value())
          as _i3.Future<List<_i4.PostModel>?>);
  @override
  _i3.Future<bool> updateFavoritePost(_i4.PostModel? post) =>
      (super.noSuchMethod(Invocation.method(#updateFavoritePost, [post]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}

/// A class which mocks [PostListRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostListRemoteDataSource extends _i1.Mock
    implements _i5.PostListRemoteDataSource {
  MockPostListRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }
}
