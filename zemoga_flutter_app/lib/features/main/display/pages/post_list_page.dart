import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/features/main/display/provider/post_list_provider.dart';
import 'package:zemoga_flutter_app/features/main/display/widgets/post_widget.dart';

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
    final postList = Provider.of<PostListProvider>(context).postsList;
    final failure = Provider.of<PostListProvider>(context).failure;

    if (postList != null) {
      return ListView.separated(
        itemCount: postList.length,
        itemBuilder: ((context, index) => PostWidget(
              post: postList[index],
            )),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          thickness: 2.0,
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
