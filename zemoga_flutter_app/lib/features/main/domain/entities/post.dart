import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json[_AttributeKeys.userId],
        id: json[_AttributeKeys.id],
        title: json[_AttributeKeys.title],
        body: json[_AttributeKeys.body],
      );

  Map<String, dynamic> toJson() => {
        _AttributeKeys.userId: userId,
        _AttributeKeys.id: id,
        _AttributeKeys.title: title,
        _AttributeKeys.body: body,
      };

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}

abstract class _AttributeKeys {
  static const userId = 'userId';
  static const id = ' id';
  static const title = ' title';
  static const body = ' body';
}
