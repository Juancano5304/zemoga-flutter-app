import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  const Comment({
    required this.body,
    required this.email,
    required this.id,
    required this.name,
    required this.postId,
  });

  final String body;
  final String email;
  final int id;
  final String name;
  final int postId;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        body: json[_AttributeKeys.body],
        email: json[_AttributeKeys.email],
        id: json[_AttributeKeys.id],
        name: json[_AttributeKeys.name],
        postId: json[_AttributeKeys.postId],
      );

  Map<String, dynamic> toJson() => {
        _AttributeKeys.body: body,
        _AttributeKeys.email: email,
        _AttributeKeys.id: id,
        _AttributeKeys.name: name,
        _AttributeKeys.postId: postId,
      };

  @override
  List<Object?> get props => [
        body,
        email,
        id,
        name,
        postId,
      ];
}

abstract class _AttributeKeys {
  static const body = 'body';
  static const email = 'email';
  static const id = 'id';
  static const name = 'name';
  static const postId = 'postId';
}
