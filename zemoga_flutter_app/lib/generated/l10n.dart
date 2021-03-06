// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `ALL`
  String get allTab {
    return Intl.message(
      'ALL',
      name: 'allTab',
      desc: '',
      args: [],
    );
  }

  /// `COMMENTS`
  String get commentsTitle {
    return Intl.message(
      'COMMENTS',
      name: 'commentsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionTitle {
    return Intl.message(
      'Description',
      name: 'descriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Deleted post list`
  String get deletedPostList {
    return Intl.message(
      'Deleted post list',
      name: 'deletedPostList',
      desc: '',
      args: [],
    );
  }

  /// `Had no favorites yet`
  String get favoritesEmptyState {
    return Intl.message(
      'Had no favorites yet',
      name: 'favoritesEmptyState',
      desc: '',
      args: [],
    );
  }

  /// `FAVORITES`
  String get favoritesTab {
    return Intl.message(
      'FAVORITES',
      name: 'favoritesTab',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get mainPageTitle {
    return Intl.message(
      'Posts',
      name: 'mainPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `There is no post saved`
  String get notAvailablePost {
    return Intl.message(
      'There is no post saved',
      name: 'notAvailablePost',
      desc: '',
      args: [],
    );
  }

  /// `Press action icon to reload`
  String get pressToReload {
    return Intl.message(
      'Press action icon to reload',
      name: 'pressToReload',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get userEmail {
    return Intl.message(
      'Email',
      name: 'userEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get userName {
    return Intl.message(
      'Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get userPhone {
    return Intl.message(
      'Phone',
      name: 'userPhone',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get userTitle {
    return Intl.message(
      'User',
      name: 'userTitle',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get userWebsite {
    return Intl.message(
      'Website',
      name: 'userWebsite',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
