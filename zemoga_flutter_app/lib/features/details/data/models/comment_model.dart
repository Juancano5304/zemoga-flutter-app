// ignore_for_file: overridden_fields, annotate_overrides

import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';

class CommentModel extends Comment {
  const CommentModel({
    required this.body,
    required this.email,
    required this.id,
    required this.name,
    required this.postId,
  }) : super(
          body: body,
          email: email,
          id: id,
          name: name,
          postId: postId,
        );

  final int id;
  final int postId;
  final String body;
  final String email;
  final String name;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        body: json[_AttributeKeys.body],
        email: json[_AttributeKeys.email],
        id: json[_AttributeKeys.id],
        name: json[_AttributeKeys.name],
        postId: json[_AttributeKeys.postId],
      );

  @override
  Map<String, dynamic> toJson() => {
        _AttributeKeys.body: body,
        _AttributeKeys.email: email,
        _AttributeKeys.id: id,
        _AttributeKeys.name: name,
        _AttributeKeys.postId: postId,
      };

  static List<CommentModel>? fromList(dynamic list) {
    var result = <CommentModel>[];
    if (list != null) {
      result = [];
      for (dynamic comment in list) {
        final commentModel = CommentModel.fromJson(comment);
        result.add(commentModel);
      }
    }
    return result;
  }
}

abstract class _AttributeKeys {
  static const body = 'body';
  static const email = 'email';
  static const id = 'id';
  static const name = 'name';
  static const postId = 'postId';
}
