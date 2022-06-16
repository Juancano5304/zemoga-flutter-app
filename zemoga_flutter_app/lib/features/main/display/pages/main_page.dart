import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/features/main/display/pages/favorites_list_page.dart';
import 'package:zemoga_flutter_app/features/main/display/pages/post_list_page.dart';
import 'package:zemoga_flutter_app/features/main/display/provider/post_list_provider.dart';
import 'package:zemoga_flutter_app/generated/l10n.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    final localizations = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<PostListProvider>(context, listen: false)
                    .eitherFailureOrPostList();
              },
              icon: const Icon(
                Icons.replay,
                color: Colors.white,
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(
                text: localizations.allTab,
              ),
              Tab(
                text: localizations.favoritesTab,
              ),
            ],
          ),
          title: Text(
            localizations.mainPageTitle,
          ),
        ),
        body: const TabBarView(
          children: [
            PostListPage(),
            FavoritesListPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.delete),
          onPressed: () async =>
              Provider.of<PostListProvider>(context, listen: false)
                  .deletePostList()
                  .then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          localizations.deletedPostList,
                        ),
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}
