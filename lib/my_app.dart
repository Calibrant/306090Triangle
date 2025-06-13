import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

// Локализация и Провайдеры
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:triangle_306090/ads/ad_helper.dart';
import 'package:triangle_306090/generated/l10n/app_localizations.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';

// Экраны
import 'screens/calculator_page.dart';
import 'screens/full_history_page.dart';
import 'screens/settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем провайдеры для MaterialApp
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      // Заголовок приложения будет извлекаться из AppLocalizations на каждом экране
      // поэтому здесь можно оставить общий или убрать
      debugShowCheckedModeBanner: false, // Убираем дебаг баннер
      locale: localeProvider.locale, // Устанавливаем текущую локаль
      supportedLocales:
          LocaleProvider.supportedLocalesList, // Список поддерживаемых локалей
      localizationsDelegates: [
        // Делегаты для локализации
        AppLocalizations.delegate, // Наш сгенерированный делегат
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
          // Светлая тема
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          primaryColor: Colors.green[700],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
            elevation: 2.0, // Небольшая тень
            titleTextStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          scaffoldBackgroundColor: Colors.grey[100],
          cardTheme: CardThemeData(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              // foregroundColor: Colors.white, // Цвет текста кнопки
              // backgroundColor: Colors.green[600], // Цвет фона кнопки
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // foregroundColor: Colors.green[700],
                  textStyle: const TextStyle(fontWeight: FontWeight.w600))),
          inputDecorationTheme: InputDecorationTheme(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[700]!, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors
                .white, // Иконки и текст на фоне бара должны быть контрастными
            unselectedItemColor: Colors.white
                .withValues(alpha: 0.7), // Немного приглушенный для неактивных
            backgroundColor: Colors.green[700], // Тот же цвет, что и AppBar
            elevation: 8.0, // Можно добавить тень для выделения
          ),
          dividerTheme: DividerThemeData(
            thickness: 0.8,
            color: Colors.grey[300],
          )),
      darkTheme: ThemeData(
          // Темная тема
          brightness: Brightness.dark,
          primarySwatch: Colors.teal, // Используем другой цвет для темной темы
          primaryColor: Colors.teal[700],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[850], // Более темный AppBar
            foregroundColor: Colors.white,
            elevation: 2.0,
            titleTextStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          scaffoldBackgroundColor: Colors.grey[900], // Очень темный фон
          cardTheme: CardThemeData(
            elevation: 1.0,
            color: Colors.grey[800], // Цвет карточек
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              // foregroundColor: Colors.white,
              // backgroundColor: Colors.teal[600],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // foregroundColor: Colors.tealAccent[100],
                  textStyle: const TextStyle(fontWeight: FontWeight.w600))),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey[700]!)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            labelStyle: TextStyle(color: Colors.grey[400]),
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.tealAccent,
            unselectedItemColor: Colors.grey[500],
            backgroundColor:
                Colors.grey[850], // Фон для BottomNavBar в темной теме
          ),
          dividerTheme: DividerThemeData(
            thickness: 0.8,
            color: Colors.grey[700],
          )),

      home: const MainScreenContainer(), // Наш главный контейнер с BottomNavBar
    );
  }
}

class MainScreenContainer extends StatefulWidget {
  const MainScreenContainer({super.key});

  @override
  State<MainScreenContainer> createState() => _MainScreenContainerState();
}

class _MainScreenContainerState extends State<MainScreenContainer> {
  int _selectedIndex = 0;

  // Список страниц для BottomNavigationBar
  static final List<Widget> _widgetOptions = <Widget>[
    const CalculatorPage(), // Страница калькулятора (мы ее создадим/перенесем)
    const FullHistoryPage(), // Страница полной истории (мы ее создадим)
    const SettingsPage(), // Страница настроек (мы ее создадим)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Состояние для баннера
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  void _loadBannerAd() {
    // Если вы не создавали AdHelper, логика создания BannerAd будет здесь
    // final adUnitId = Platform.isAndroid
    //   ? 'ca-app-pub-3940256099942544/6300978111'
    //   : 'ca-app-pub-3940256099942544/2934735716';

    _bannerAd = AdHelper.createBannerAd(
      // Используем AdHelper
      onAdLoaded: () {
        if (mounted) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        }
      },
    );
    _bannerAd?.load(); // Загружаем рекламу
  }

  // Адаптивный размер баннера (лучше вычислять один раз)
  // Этот метод нужно будет вызывать в build, если вы хотите адаптивный размер,
  // передавая context, чтобы получить ширину экрана.
  // AdSize _getAdaptiveBannerAdSize(BuildContext context) {
  //   return AdSize.getAnchoredAdaptiveBannerAdSize(
  //         Orientation.portrait, // или Orientation.landscape, если нужно
  //         MediaQuery.of(context).size.width.truncate()) ??
  //       AdSize.banner;
  // }

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose(); // Освобождаем ресурсы баннера
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n =
        AppLocalizations.of(context)!; // Получаем локализованные строки

    // Динамические заголовки для AppBar в зависимости от выбранной вкладки
    final List<String> pageTitles = [
      l10n.calculatorPageTitle,
      l10n.historyPageTitle,
      l10n.settingsPageTitle,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[_selectedIndex]),
        // Можно добавить actions сюда, если они общие для всех страниц
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              // Используем IndexedStack для сохранения состояния страниц
              index: _selectedIndex,
              children: _widgetOptions,
            ),
          ),
          // Контейнер для баннера
          if (_isBannerAdLoaded && _bannerAd != null)
            Container(
              alignment: Alignment.center,
              width: _bannerAd!.size.width
                  .toDouble(), // Используем размер загруженного баннера
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            )
          else // Если баннер не загружен, можно показать плейсхолдер или ничего
            SizedBox(
                height: AdSize.banner.height
                    .toDouble()), // Резервируем место под стандартный баннер
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.calculate_outlined),
            activeIcon: const Icon(Icons.calculate),
            label: l10n.calculatorPageTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history_outlined),
            activeIcon: const Icon(Icons.history),
            label: l10n.historyPageTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: l10n.settingsPageTitle,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // selectedFontSize: 14, // Можно настроить размеры шрифтов
        // unselectedFontSize: 12,
        type:
            BottomNavigationBarType.fixed, // Или .shifting, если хотите эффекты
      ),
    );
  }
}
