import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:triangle_306090/my_app.dart';
import 'package:triangle_306090/providers/locale_provider.dart';
import 'package:triangle_306090/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Важно для SharedPreferences и других плагинов
 await MobileAds.instance.initialize(); 
  // Создаем экземпляры провайдеров заранее, чтобы загрузить предпочтения
  final themeProvider = ThemeProvider();
  final localeProvider = LocaleProvider();

  // Явный вызов загрузки предпочтений (хотя они и в конструкторах)
  // Это гарантирует, что к моменту runApp они уже попытались загрузиться
  await Future.wait([
    _loadPrefs(themeProvider),
    _loadPrefs(localeProvider),
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider.value(value: localeProvider),
      ],
      child: const MyApp(),
    ),
  );
}

// Вспомогательная функция для ожидания загрузки настроек провайдера
Future<void> _loadPrefs(ChangeNotifier provider) async {
  if (provider is ThemeProvider) {
     provider
        .themeMode; // Доступ к getter'у инициирует загрузку, если она асинхронна
  } else if (provider is LocaleProvider) {
     provider.locale; // Аналогично
  }
}
