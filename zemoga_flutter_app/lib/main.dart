import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/core/navigation/app_router.dart';
import 'package:zemoga_flutter_app/features/main/display/pages/main_page.dart';
import 'package:zemoga_flutter_app/generated/l10n.dart';
import 'package:zemoga_flutter_app/theme/app_themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        // ChangeNotifierProvider(create: ((context) => PostListProvider(),),

        // ChangeNotifierProvider(create: ((context) => PostDetailProvider(),),
        // ChangeNotifierProvider(create: ((context) => PostCommentsProvider(),),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: AppRouter.generatedRoutes,
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        title: 'Material App',
        theme: AppThemes.lightTheme,
        home: const MainPage(),
      ),
    );
  }
}
