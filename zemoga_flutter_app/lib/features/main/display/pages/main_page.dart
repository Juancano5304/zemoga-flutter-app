import 'package:flutter/material.dart';
import 'package:zemoga_flutter_app/features/main/display/pages/favorites_list_page.dart';
import 'package:zemoga_flutter_app/features/main/display/pages/post_list_page.dart';
import 'package:zemoga_flutter_app/generated/l10n.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
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
                text: localizations.allTab,
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
      ),
    );
  }
}
