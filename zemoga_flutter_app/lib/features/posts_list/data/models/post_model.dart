import 'package:zemoga_flutter_app/features/posts_list/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required this.body,
    required this.id,
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
      title: json[_AttributeKeys.title],
      userId: (json[_AttributeKeys.userId] as num).toInt(),
    );
  }

  static List<PostModel>? fromList(dynamic list) {
    var result = <PostModel>[];
    if (list != null) {
      result = [];
      for (dynamic json in list) {
        result.add(PostModel.fromJson(json));
      }
    }
    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      _AttributeKeys.body: body,
      _AttributeKeys.id: id,
      _AttributeKeys.title: title,
      _AttributeKeys.userId: userId,
    };
  }

  @override
  final int userId;

  @override
  final int id;

  @override
  final String title;

  @override
  final String body;
}

abstract class _AttributeKeys {
  static const body = ' body';
  static const id = ' id';
  static const title = ' title';
  static const userId = 'userId';
}
