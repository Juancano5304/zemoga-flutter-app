import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
  });

  final String body;
  final int id;
  final String title;
  final int userId;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        body: json[_AttributeKeys.body],
        id: json[_AttributeKeys.id],
        title: json[_AttributeKeys.title],
        userId: json[_AttributeKeys.userId],
      );

  Map<String, dynamic> toJson() => {
        _AttributeKeys.body: body,
        _AttributeKeys.id: id,
        _AttributeKeys.title: title,
        _AttributeKeys.userId: userId,
      };

  @override
  List<Object?> get props => [
        body,
        id,
        title,
        userId,
      ];
}

abstract class _AttributeKeys {
  static const body = 'body';
  static const id = 'id';
  static const title = 'title';
  static const userId = 'userId';
}
