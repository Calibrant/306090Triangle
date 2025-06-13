import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

// Локализация и Провайдеры
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:triangle_306090/ads/ad_helper.dart';
import 'package:triangle_306090/l10n/app_localizations.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';

// Экраны
import 'screens/calculator_page.dart'; // Мы создадим этот файл
import 'screens/full_history_page.dart'; // Мы создадим этот файл
import 'screens/settings_page.dart'; // Мы создадим этот файл

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

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();
  final _controllerC = TextEditingController();

  TriangleModel? _triangle;
  String _activeInput = ''; // 'A', 'B', or 'C'

  // Для истории
  List<CalculationHistoryItem> _history = [];
  bool _isLoadingHistory = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
    _controllerA.addListener(() => _handleInputFocus(_controllerA, 'A'));
    _controllerB.addListener(() => _handleInputFocus(_controllerB, 'B'));
    _controllerC.addListener(() => _handleInputFocus(_controllerC, 'C'));
  }

  Future<void> _loadHistory() async {
    setState(() {
      _isLoadingHistory = true;
    });
    final loadedHistory = await HistoryService.loadHistory();
    setState(() {
      _history = loadedHistory;
      _isLoadingHistory = false;
    });
  }

  Future<void> _addAndSaveHistoryItem(CalculationHistoryItem item) async {
    setState(() {
      _history.insert(0, item);
      if (_history.length > HistoryService.maxHistoryItems) {
        _history = _history.sublist(0, HistoryService.maxHistoryItems);
      }
    });
    await HistoryService.saveHistory(_history);
  }

  Future<void> _clearHistory() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Подтверждение'),
          content: const Text('Вы уверены, что хотите очистить историю вычислений?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Очистить', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      setState(() {
        _history.clear();
      });
      await HistoryService.clearHistory();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('История очищена')),
        );
      }
    }
  }

  void _handleInputFocus(TextEditingController controller, String fieldName) {
    // Эта логика позволяет пользователю переключаться между полями,
    // вводя текст. Активным становится то поле, в которое вводят.
    if (controller.text.isNotEmpty) {
      if (_activeInput != fieldName) {
        setState(() {
          _activeInput = fieldName;
          // Очищаем другие поля при начале ввода в новое поле, если они не были активны
          if (fieldName == 'A') { if (_controllerB.text.isNotEmpty || _controllerC.text.isNotEmpty) {_controllerB.clear(); _controllerC.clear();} }
          else if (fieldName == 'B') { if (_controllerA.text.isNotEmpty || _controllerC.text.isNotEmpty) {_controllerA.clear(); _controllerC.clear();} }
          else if (fieldName == 'C') { if (_controllerA.text.isNotEmpty || _controllerB.text.isNotEmpty) {_controllerA.clear(); _controllerB.clear();} }
        });
      }
    } else { // Если поле очищено
      bool allEmpty = _controllerA.text.isEmpty && _controllerB.text.isEmpty && _controllerC.text.isEmpty;
      if (allEmpty) {
        setState(() {
          _activeInput = '';
        });
      }
      // Если это было активное поле и его очистили, _activeInput остается,
      // позволяя ввести новое значение в это же поле, или в другое (логика выше сработает).
    }
  }


  void _calculateTriangle() {
    // Сначала скрываем клавиатуру
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      double? value;
      String inputSideNameForCalc = _activeInput; // Используем _activeInput для определения, из какого поля брать значение

      // Если _activeInput пуст (например, после сброса и ввода без потери фокуса с кнопки),
      // пытаемся найти первое непустое поле.
      if (inputSideNameForCalc.isEmpty) {
        if (_controllerA.text.isNotEmpty) inputSideNameForCalc = 'A';
        else if (_controllerB.text.isNotEmpty) inputSideNameForCalc = 'B';
        else if (_controllerC.text.isNotEmpty) inputSideNameForCalc = 'C';
      }

      if (inputSideNameForCalc == 'A' && _controllerA.text.isNotEmpty) {
        value = double.tryParse(_controllerA.text);
      } else if (inputSideNameForCalc == 'B' && _controllerB.text.isNotEmpty) {
        value = double.tryParse(_controllerB.text);
      } else if (inputSideNameForCalc == 'C' && _controllerC.text.isNotEmpty) {
        value = double.tryParse(_controllerC.text);
      }

      if (value == null || value <= 0) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Пожалуйста, введите корректное положительное число для одной из сторон.')),
          );
        }
        return;
      }

      TriangleModel? newTriangle;
      try {
        if (inputSideNameForCalc == 'A') {
          newTriangle = TriangleModel.calculateFromA(value);
        } else if (inputSideNameForCalc == 'B') {
          newTriangle = TriangleModel.calculateFromB(value);
        } else if (inputSideNameForCalc == 'C') {
          newTriangle = TriangleModel.calculateFromC(value);
        }

        if (newTriangle != null) {
          setState(() {
            _triangle = newTriangle;
            // Обновляем текстовые поля с рассчитанными значениями, КРОМЕ введенного
            if (inputSideNameForCalc != 'A') _controllerA.text = _triangle!.sideA.toStringAsFixed(2);
            if (inputSideNameForCalc != 'B') _controllerB.text = _triangle!.sideB.toStringAsFixed(2);
            if (inputSideNameForCalc != 'C') _controllerC.text = _triangle!.sideC.toStringAsFixed(2);
          });

          final historyItem = CalculationHistoryItem(
            inputSideName: inputSideNameForCalc,
            inputValue: value,
            sideA: _triangle!.sideA,
            sideB: _triangle!.sideB,
            sideC: _triangle!.sideC,
            area: _triangle!.area,
            perimeter: _triangle!.perimeter,
            timestamp: DateTime.now(),
          );
          _addAndSaveHistoryItem(historyItem);

        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка при расчете: $e')),
          );
        }
        setState(() {
          _triangle = null;
        });
      }
    } else {
       if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Пожалуйста, исправьте ошибки в полях ввода.')),
          );
        }
    }
  }

  void _resetFields() {
    FocusScope.of(context).unfocus(); // Скрываем клавиатуру
    _formKey.currentState?.reset(); // Безопасный вызов
    _controllerA.clear();
    _controllerB.clear();
    _controllerC.clear();
    setState(() {
      _triangle = null;
      _activeInput = '';
    });
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    _controllerC.dispose();
    super.dispose();
  }

  Widget _buildTextField(String labelText, String hintSuffix, TextEditingController controller, String fieldName) {
    // Поле всегда включено, логика _activeInput определяет, какое значение будет использовано
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText, // 'Сторона A (катет против 30°)'
          hintText: 'Введите длину стороны $hintSuffix', // 'A'
          border: const OutlineInputBorder(),
          // Визуальное выделение активного поля, если нужно:
          // focusedBorder: _activeInput == fieldName ? OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0)) : null,
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        validator: (value) {
          // Валидация применяется только если это поле должно быть заполнено
          // (т.е. оно активное или единственное заполненное)
          bool isPotentiallyActive = _activeInput == fieldName || 
                                     (_activeInput.isEmpty && controller.text.isNotEmpty);
          
          bool anyFieldFilled = _controllerA.text.isNotEmpty || _controllerB.text.isNotEmpty || _controllerC.text.isNotEmpty;

          if (!anyFieldFilled && (_activeInput.isEmpty && _formKey.currentState?.validate() == true)) {
            // Если все поля пусты и мы пытаемся валидировать (например, при нажатии Рассчитать)
            // Это условие нужно уточнить, т.к. validate() вызовет валидатор для всех полей.
            // Проверка на пустоту всех полей лучше делать в _calculateTriangle перед вызовом validate.
            // Для отдельного поля:
             if (value == null || value.isEmpty) {
                // Если ни одно поле не активно и это поле пустое, не выдаем ошибку,
                // если другие поля тоже пустые. Ошибка будет, если все пустые и нажали "Рассчитать".
                // Здесь мы можем решить, что если поле неактивно и пусто - это не ошибка.
                // Ошибка, если оно АКТИВНОЕ и пустое.
                if (_activeInput == fieldName) return 'Пожалуйста, введите значение';
                return null; // Не ошибка, если неактивное и пустое
             }
          }


          if (value != null && value.isNotEmpty) {
            final number = double.tryParse(value);
            if (number == null) {
              return 'Некорректный формат числа';
            }
            if (number <= 0) {
              return 'Значение должно быть > 0';
            }
          } else {
            // Если поле пустое, но оно выбрано как активное для расчета
            if (_activeInput == fieldName) {
                 return 'Пожалуйста, введите значение';
            }
          }
          return null;
        },
        onTap: () {
          // При тапе делаем поле активным, если оно еще не было,
          // и если оно пустое, то не очищаем другие, если там что-то было введено.
          // Если оно не пустое, то handleInputFocus сделает свою работу.
          if (_activeInput != fieldName) {
            // Не меняем _activeInput здесь напрямую, чтобы не конфликтовать с onChanged
            // handleInputFocus сделает это при начале ввода
          }
        },
        onChanged: (text) {
          _handleInputFocus(controller, fieldName); 
          // Вызываем setState, чтобы _activeInput обновился и UI мог перерисоваться
          // (например, для focusedBorder или другой логики, зависящей от _activeInput)
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String displayInputSideName = '';
    double displayInputValue = 0;

    if (_triangle != null && _activeInput.isNotEmpty) {
        displayInputSideName = _activeInput;
        // Пытаемся получить значение из активного контроллера
        TextEditingController activeController;
        if (_activeInput == 'A') activeController = _controllerA;
        else if (_activeInput == 'B') activeController = _controllerB;
        else activeController = _controllerC;
        
        displayInputValue = double.tryParse(activeController.text) ?? 0;
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор 30-60-90'),
        backgroundColor: Colors.blueGrey[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField('Сторона A (катет против 30°)', 'A', _controllerA, 'A'),
              _buildTextField('Сторона B (катет против 60°)', 'B', _controllerB, 'B'),
              _buildTextField('Сторона C (гипотенуза)', 'C', _controllerC, 'C'),
              const SizedBox(height: 20),
              // === ЗАМЕНЕННЫЙ БЛОК КНОПОК ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: _calculateTriangle,
                    icon: const Icon(Icons.calculate),
                    label: const Text('Рассчитать'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, 
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _resetFields,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Сброс'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              // === КОНЕЦ ЗАМЕНЕННОГО БЛОКА КНОПОК ===
              const SizedBox(height: 20),
              if (_triangle != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Площадь: ${_triangle!.area.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Text('Периметр: ${_triangle!.perimeter.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 300, // или MediaQuery.of(context).size.width * 0.8
                        height: 200, // или width * 0.6 для соотношения сторон
                        child: CustomPaint(
                          painter: TrianglePainter(
                            triangle: _triangle!,
                            inputSideName: displayInputSideName, // Передаем актуальное имя введенной стороны
                            inputValue: displayInputValue, // И ее значение
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 24), 
              if (_isLoadingHistory)
                const Center(child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ))
              else
                HistoryViewWidget(
                  historyItems: _history,
                  onClearHistory: _clearHistory,
                ),
            ],
          ),
        ),
      ),
    );
  }
} */
