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

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `30 60 90 triangle`
  String get app_bar_title {
    return Intl.message(
      '30 60 90 triangle',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `side а`
  String get side_a {
    return Intl.message('side а', name: 'side_a', desc: '', args: []);
  }

  /// `side b`
  String get side_b {
    return Intl.message('side b', name: 'side_b', desc: '', args: []);
  }

  /// `side c`
  String get side_c {
    return Intl.message('side c', name: 'side_c', desc: '', args: []);
  }

  /// `area A`
  String get area_A {
    return Intl.message('area A', name: 'area_A', desc: '', args: []);
  }

  /// `perimetr P`
  String get periment_P {
    return Intl.message('perimetr P', name: 'periment_P', desc: '', args: []);
  }

  /// `Rate this app`
  String get rate_app {
    return Intl.message('Rate this app', name: 'rate_app', desc: '', args: []);
  }

  /// `Go to Google play`
  String get rate_on_google_play {
    return Intl.message(
      'Go to Google play',
      name: 'rate_on_google_play',
      desc: '',
      args: [],
    );
  }

  /// `Decimal places`
  String get decimal_places {
    return Intl.message(
      'Decimal places',
      name: 'decimal_places',
      desc: '',
      args: [],
    );
  }

  /// `About app`
  String get help {
    return Intl.message('About app', name: 'help', desc: '', args: []);
  }

  /// `This is a right triangle with interior angles of 30°, 60°, and 90° degrees. With this calculator, where all the angles are known, you can calculate the dimensions of the sides, area and perimeter of the triangle. All you have to do is to type in the value of any of the sides and the calculator will do the rest!\nIf you find this application useful, please rate it.\nFound a translation error? Let us know about it.`
  String get help_desc {
    return Intl.message(
      'This is a right triangle with interior angles of 30°, 60°, and 90° degrees. With this calculator, where all the angles are known, you can calculate the dimensions of the sides, area and perimeter of the triangle. All you have to do is to type in the value of any of the sides and the calculator will do the rest!\nIf you find this application useful, please rate it.\nFound a translation error? Let us know about it.',
      name: 'help_desc',
      desc: '',
      args: [],
    );
  }

  /// `zero`
  String get zero {
    return Intl.message('zero', name: 'zero', desc: '', args: []);
  }

  /// `one`
  String get one {
    return Intl.message('one', name: 'one', desc: '', args: []);
  }

  /// `two`
  String get two {
    return Intl.message('two', name: 'two', desc: '', args: []);
  }

  /// `three`
  String get three {
    return Intl.message('three', name: 'three', desc: '', args: []);
  }

  /// `four`
  String get four {
    return Intl.message('four', name: 'four', desc: '', args: []);
  }

  /// `Show`
  String get show_btn {
    return Intl.message('Show', name: 'show_btn', desc: '', args: []);
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `30 60 90 triangle`
  String get drawer_header {
    return Intl.message(
      '30 60 90 triangle',
      name: 'drawer_header',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'PH'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'CA'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'ko', countryCode: 'KR'),
      Locale.fromSubtags(languageCode: 'ms', countryCode: 'MY'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'PT'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'tl', countryCode: 'PH'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
