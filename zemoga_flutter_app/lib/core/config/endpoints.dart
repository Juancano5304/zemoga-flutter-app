class Endpoints {
  final String posts;

  Endpoints({required this.posts});

  factory Endpoints.fromJson(Map<String, dynamic> json) => Endpoints(
        posts: json[_AttributeKeys.posts],
      );
}

abstract class _AttributeKeys {
  static const posts = 'posts';
}
