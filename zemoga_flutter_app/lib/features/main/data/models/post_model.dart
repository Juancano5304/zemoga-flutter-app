// ignore_for_file: overridden_fields, must_be_immutable, annotate_overrides

import 'package:zemoga_flutter_app/features/main/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required this.body,
    required this.id,
    bool isFavorite = false,
    required this.title,
    required this.userId,
  }) : super(
          body: body,
          id: id,
          title: title,
          userId: userId,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json[_AttributeKeys.body],
      id: (json[_AttributeKeys.id] as num).toInt(),
      isFavorite: json[_AttributeKeys.isFavorite] ?? false,
      title: json[_AttributeKeys.title],
      userId: (json[_AttributeKeys.userId] as num).toInt(),
    );
  }

  static List<PostModel>? fromList(dynamic list) {
    var result = <PostModel>[];
    if (list != null) {
      result = [];
      for (dynamic json in list) {
        final postModel = PostModel.fromJson(json)..isFavorite = false;
        result.add(postModel);
      }
    }
    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      _AttributeKeys.body: body,
      _AttributeKeys.id: id,
      _AttributeKeys.isFavorite: isFavorite,
      _AttributeKeys.title: title,
      _AttributeKeys.userId: userId,
    };
  }

  final int userId;
  final int id;
  final String title;
  final String body;
  bool? isFavorite;
}

abstract class _AttributeKeys {
  static const body = 'body';
  static const id = 'id';
  static const isFavorite = 'isFavorite';
  static const title = 'title';
  static const userId = 'userId';
}
