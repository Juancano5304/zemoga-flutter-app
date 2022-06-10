import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/features/main/display/provider/post_list_provider.dart';
import 'package:zemoga_flutter_app/features/main/display/widgets/post_widget.dart';
import 'package:zemoga_flutter_app/generated/l10n.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({Key? key}) : super(key: key);

  @override
  State<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final failure = Provider.of<PostListProvider>(context).failure;
    final localizations = AppLocalizations.of(context);
    final postList = Provider.of<PostListProvider>(context).postsList;

    if (postList != null) {
      final isFavoritePostList = postList
          .where(
            (element) => element.isFavorite == true,
          )
          .toList();

      if (isFavoritePostList.isEmpty) {
        return Center(
          child: Text(
            localizations.favoritesEmptyState,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        );
      }
      return Expanded(
        child: ListView.separated(
          itemCount: isFavoritePostList.length,
          itemBuilder: ((context, index) => PostWidget(
                post: isFavoritePostList[index],
              )),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
            thickness: 2.0,
          ),
        ),
      );
    } else if (failure != null) {
      return Expanded(
        child: Center(
          child: Text(
            failure.errorMessage!,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
