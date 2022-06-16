// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/core/navigation/named_routes.dart';
import 'package:zemoga_flutter_app/features/main/data/models/post_model.dart';
import 'package:zemoga_flutter_app/features/main/display/provider/post_list_provider.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        NamedRoutes.details,
        arguments: {
          'body': widget.post.body,
          'id': widget.post.userId,
          'postId': widget.post.id,
        },
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(widget.post.title),
            ),
            InkWell(
              onTap: (() async {
                Provider.of<PostListProvider>(context, listen: false)
                    .updateFavoritePost(widget.post);
                setState(
                    () => widget.post.isFavorite = !widget.post.isFavorite!);
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 5),
                  width: widget.post.isFavorite! ? 32.0 : 24.0,
                  child: widget.post.isFavorite!
                      ? const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 32.0,
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 24.0,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
