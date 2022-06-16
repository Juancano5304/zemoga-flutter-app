class Endpoints {
  Endpoints({
    required this.comments,
    required this.posts,
    required this.users,
  });

  final String comments;
  final String posts;
  final String users;

  factory Endpoints.fromJson(Map<String, dynamic> json) => Endpoints(
        comments: json[_AttributeKeys.comments],
        posts: json[_AttributeKeys.posts],
        users: json[_AttributeKeys.users],
      );
}

abstract class _AttributeKeys {
  static const comments = 'comments';
  static const posts = 'posts';
  static const users = 'users';
}
