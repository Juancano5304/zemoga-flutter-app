import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/features/main/display/provider/post_list_provider.dart';
import 'package:zemoga_flutter_app/features/main/display/widgets/post_widget.dart';
import 'package:zemoga_flutter_app/generated/l10n.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await Provider.of<PostListProvider>(context, listen: false)
            .eitherFailureOrPostList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final failure = Provider.of<PostListProvider>(context).failure;
    final localizations = AppLocalizations.of(context);
    final postList = Provider.of<PostListProvider>(context).postsList;

    if (postList != null) {
      postList.sort((a, b) {
        if (b.isFavorite != null && b.isFavorite!) {
          return 1;
        } else {
          return -1;
        }
      });
      return RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView.separated(
          itemCount: postList.length,
          itemBuilder: ((context, index) => Dismissible(
                background: Container(
                  color: Colors.red,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
                key: Key(postList[index].id.toString()),
                onDismissed: (direction) {
                  setState(
                    () {
                      final postToRemove = postList[index];
                      Provider.of<PostListProvider>(context, listen: false)
                          .postsList!
                          .remove(postToRemove);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          action: SnackBarAction(
                            label: localizations.undo,
                            onPressed: () {
                              Provider.of<PostListProvider>(context,
                                      listen: false)
                                  .postsList!
                                  .insert(index, postToRemove);
                            },
                          ),
                          content: Text(
                            'Removed post with Id ${postToRemove.id}',
                          ),
                        ),
                      );
                    },
                  );
                },
                child: PostWidget(
                  post: postList[index],
                ),
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

    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.notAvailablePost,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Text(localizations.pressToReload),
            const SizedBox(
              height: 50.0,
            ),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
