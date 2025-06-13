import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triangle_306090/generated/l10n/app_localizations.dart';

class LocaleProvider with ChangeNotifier {
  static const String _localePrefKey = 'locale_preference_v1';
  Locale? _locale; // null означает системный язык

  Locale? get locale => _locale;

  // Поддерживаемые языки вашим приложением
  static const List<Locale> supportedLocalesList = [
    Locale('en'), // Английский
    Locale('ru'), // Русский
    Locale('de'),
    Locale('es'), // Испанский
    Locale('fr'), // Французский
    Locale('hi'), // Хинди
    Locale('id'), // Индонезийский
    Locale('ko'), // Корейский
    Locale('ja'),
    Locale('pt'), // Португальский
  ];

  LocaleProvider() {
    _loadLocalePreference();
  }

  Future<void> _loadLocalePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localePrefKey);
    if (languageCode != null && languageCode.isNotEmpty) {
      _locale = Locale(languageCode);
    } else {
      _locale = null; // Системный язык по умолчанию
    }
    notifyListeners();
  }

  void setLocale(Locale? newLocale) async {
    if (_locale == newLocale) return; // Нет изменений

    _locale = newLocale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    if (newLocale == null) {
      // Если выбран системный язык
      await prefs.remove(_localePrefKey);
    } else {
      await prefs.setString(_localePrefKey, newLocale.languageCode);
    }
  }

  // Метод для получения имени языка на текущем языке приложения
  String getLanguageDisplayName(BuildContext context, Locale? langLocale) {
    final l10n = AppLocalizations.of(context)!;
    if (langLocale == null) {
      return l10n.systemLanguage; // "Системный по умолчанию"
    }
    switch (langLocale.languageCode) {
      case 'en':
        return l10n.englishLanguage;
      case 'ru':
        return l10n.russianLanguage;
      case 'es':
        return l10n.spanishLanguage;
      case 'de':
        return l10n.germanLanguage;
      case 'fr':
        return l10n.frenchLanguage;
      case 'hi':
        return l10n.indianLanguage;
      case 'id':
        return l10n.indonesianLanguage;
      case 'ko':
        return l10n.koreanLanguage;
      case 'ja':
        return l10n.japaneseLanguage;
      case 'pt':
        return l10n.portugueseLanguage;
      // Добавьте сюда строки для названий новых языков
      // Например, для испанского вам понадобятся ключи в .arb файлах:
      // "spanishLanguage": "Spanish" (в app_en.arb)
      // "spanishLanguage": "Испанский" (в app_ru.arb)
      // "spanishLanguage": "Español" (в app_es.arb) и т.д.
      default:
        return langLocale
            .languageCode; // Возвращаем код языка, если имя не найдено
    }
  }
}
