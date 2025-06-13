// lib/screens/calculator_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triangle_306090/generated/l10n/app_localizations.dart';
import 'dart:async'; // Для Debouncer

import '../models/triangle_model.dart';
import '../widgets/triangle_painter.dart';
import '../models/calculation_history_item.dart';
import '../utils/history_service.dart';
import '../widgets/history_view_widget.dart'; // Локальная история на странице калькулятора

// Простой Debouncer для задержки вычислений при быстром вводе
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _formKey = GlobalKey<FormState>();
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();
  final _controllerC = TextEditingController();

  TriangleModel? _triangle;
  String _activeInputFieldName =
      ''; // Какое поле сейчас активно для ввода ('A', 'B', 'C')

  List<CalculationHistoryItem> _history = [];
  bool _isLoadingHistory = true;
  bool _isProgrammaticChange = false; // НОВЫЙ ФЛАГ
  // Уникальный идентификатор для текущей "сессии" ввода в поле.
  // При смене активного поля или при очистке он будет меняться.
  // Это поможет Debouncer'у понять, относится ли его вызов к текущему вводу.
  int _inputSessionId = 0;

  static const int _shortHistoryLimit = 15;

  // Debouncer для задержки автоматического расчета (например, 500 мс)
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _loadShortHistory();

    // Добавляем слушателей для автоматического расчета
    _controllerA.addListener(() => _onInputChangedRevised(_controllerA, 'A'));
    _controllerB.addListener(() => _onInputChangedRevised(_controllerB, 'B'));
    _controllerC.addListener(() => _onInputChangedRevised(_controllerC, 'C'));
  }

  Future<void> _loadShortHistory() async {
    // ... (код остается без изменений) ...
    if (!mounted) return;
    setState(() {
      _isLoadingHistory = true;
    });
    final loadedHistory = await HistoryService.loadHistory();
    if (!mounted) return;
    setState(() {
      _history = loadedHistory;
      _isLoadingHistory = false;
    });
  }

  Future<void> _addAndSaveHistoryItem(CalculationHistoryItem item) async {
    // ... (код остается без изменений, включая проверку на дубликаты, если вы ее добавили) ...
    List<CalculationHistoryItem> currentFullHistory =
        await HistoryService.loadHistory();

    // Опциональная проверка на дубликат (если результаты очень близки)
    bool isDuplicate = currentFullHistory.isNotEmpty &&
        currentFullHistory.first.inputSideName == item.inputSideName &&
        (currentFullHistory.first.inputValue - item.inputValue).abs() <
            0.001 && // Сравнение double
        (currentFullHistory.first.sideA - item.sideA).abs() < 0.001 &&
        (currentFullHistory.first.sideB - item.sideB).abs() < 0.001 &&
        (currentFullHistory.first.sideC - item.sideC).abs() < 0.001;

    if (isDuplicate) {
      // Можно не добавлять или обновить timestamp существующей записи, если нужно
      return;
    }

    currentFullHistory.insert(0, item);
    if (currentFullHistory.length > HistoryService.maxHistoryItems) {
      currentFullHistory =
          currentFullHistory.sublist(0, HistoryService.maxHistoryItems);
    }

    await HistoryService.saveHistory(currentFullHistory);

    if (!mounted) return;
    setState(() {
      _history = currentFullHistory;
    });
  }

  // lib/screens/calculator_page.dart

// ... (импорты и остальная часть класса _CalculatorPageState) ...

  Future<void> _clearShortHistoryView() async {
    final l10n =
        AppLocalizations.of(context)!; // Получаем локализованные строки

    // Отображаем диалог подтверждения
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        // Важно использовать другой BuildContext для диалога
        return AlertDialog(
          title: Text(l10n.confirmClearHistoryTitle), // "Подтверждение"
          content: Text(l10n
              .confirmClearHistoryContent), // "Вы уверены, что хотите очистить историю вычислений?"
          actions: <Widget>[
            TextButton(
              child: Text(l10n.cancelButton), // "Отмена"
              onPressed: () {
                Navigator.of(dialogContext)
                    .pop(false); // Закрыть диалог и вернуть false
              },
            ),
            TextButton(
              child: Text(
                l10n.clearButton, // "Очистить"
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .error), // Красный цвет для кнопки Очистить
              ),
              onPressed: () {
                Navigator.of(dialogContext)
                    .pop(true); // Закрыть диалог и вернуть true
              },
            ),
          ],
        );
      },
    );

    // Если пользователь подтвердил (нажал "Очистить")
    if (confirm == true) {
      await HistoryService
          .clearHistory(); // Очищаем историю в SharedPreferences
      if (mounted) {
        // Проверяем, что виджет все еще в дереве
        setState(() {
          _history
              .clear(); // Очищаем и локальный список для отображения на этой странице
          // _isLoadingHistory можно оставить true или false, в зависимости от того,
          // хотите ли вы показывать индикатор загрузки после очистки (обычно нет, так как список просто пуст)
          // Если _isLoadingHistory было true, и мы его не сбросили, то при пустом _history будет индикатор.
          // Лучше сбросить, если после очистки не предполагается немедленная загрузка.
          // В нашем случае _loadShortHistory() загрузит пустой список, и _isLoadingHistory станет false.
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.historyCleared)), // "История очищена"
        );
        // Можно также принудительно перезагрузить короткую историю, чтобы обновить состояние _isLoadingHistory
        // await _loadShortHistory(); // Это установит _isLoadingHistory в false, если история пуста
      }
    }
  }

// ... (остальной код класса _CalculatorPageState) ...

  // Вызывается при изменении текста в любом из полей
// Переделанный _onInputChangedRevised
  void _onInputChangedRevised(
      TextEditingController controller, String fieldName) {
    if (_isProgrammaticChange) return;
    if (!mounted) return;

    final String currentTextInController =
        controller.text; // Запоминаем текст на момент вызова

    if (currentTextInController.isNotEmpty &&
        _activeInputFieldName != fieldName) {
      // Пользователь начал вводить в НОВОЕ поле
      _isProgrammaticChange = true;
      setState(() {
        _activeInputFieldName = fieldName;
        // Очищаем другие контроллеры и сбрасываем _lastProcessed для них
        if (fieldName == 'A') {
          _controllerB.clear();
          _controllerC.clear();
        } else if (fieldName == 'B') {
          _controllerA.clear();
          _controllerC.clear();
        } else if (fieldName == 'C') {
          _controllerA.clear();
          _controllerB.clear();
        }
        _triangle = null;
        _inputSessionId++; // НОВАЯ СЕССИЯ ВВОДА
      });
      _isProgrammaticChange = false;
    } else if (currentTextInController.isEmpty) {
      // Пользователь очистил АКТИВНОЕ поле
      bool allEmpty = _controllerA.text.isEmpty &&
          _controllerB.text.isEmpty &&
          _controllerC.text.isEmpty;
      if (_activeInputFieldName == fieldName || allEmpty) {
        setState(() {
          _triangle = null;
          if (allEmpty) _activeInputFieldName = '';
          _inputSessionId++; // НОВАЯ СЕССИЯ (или сброс)
        });
      }
      _debouncer.dispose();
      return;
    }

    // Если текст не пуст и это активное поле (или стало активным)
    if (currentTextInController.isNotEmpty &&
        _activeInputFieldName == fieldName) {
      final int capturedSessionId =
          _inputSessionId; // Захватываем ID текущей сессии
      _debouncer.run(() {
        // Внутри колбэка Debouncer мы передаем currentTextInController,
        // который был актуален на момент ЗАПУСКА Debouncer'а.
        if (mounted && !_isProgrammaticChange) {
          // Проверяем флаг здесь тоже
          _performCalculationRevised(controller, fieldName,
              currentTextInController, capturedSessionId);
        }
      });
    }
  }

  // Основная логика расчета, теперь вызывается из _onInputChanged через Debouncer
  // Переделанный _performCalculation с более надежным управлением флагом:
  Future<void> _performCalculationRevised(
      TextEditingController activeController,
      String inputFieldName,
      String valueAtDebounceStart,
      int sessionIdAtDebounceStart) async {
    // Если сессия ввода изменилась с момента запуска Debouncer'а, игнорируем этот вызов.
    if (_inputSessionId != sessionIdAtDebounceStart) {
      // print("Skipping calculation: input session changed. Expected: $sessionIdAtDebounceStart, Got: $_inputSessionId"); // DEBUG
      return;
    }
    // valueAtDebounceStart - это значение, которое было в контроллере, когда Debouncer был запущен.
    // Сравниваем его с текущим значением в контроллере. Если они разные, значит пользователь продолжил ввод.
    if (activeController.text != valueAtDebounceStart) {
      // print("Skipping calculation: text changed during debounce. Expected: '$valueAtDebounceStart', Got: '${activeController.text}'"); // DEBUG
      return; // Пользователь продолжил печатать, этот вызов debouncer'а больше не актуален.
    }

    final l10n = AppLocalizations.of(context)!;
    final String textValue = activeController.text;

    // Предотвращаем повторный расчет с абсолютно тем же значением для того же поля
    /* if (textValue == _lastProcessedInputValue &&
        inputFieldName == _lastProcessedFieldName) {
      // Это может произойти, если debouncer сработал, а потом еще какой-то незначительный ивент,
      // но значение ввода не изменилось.
      // print("Skipping calculation: same input value and field as last processed."); // DEBUG
      return;
    } */

    // Если текст пуст (хотя debouncer не должен был сработать для пустого текста при текущей логике _onInputChangedRevised)
    if (textValue.isEmpty) {
      if (mounted) setState(() => _triangle = null);
      return;
    }
    double? value = double.tryParse(textValue);

    if (value == null || value <= 0) {
      // Показать SnackBar с ошибкой валидации, если нужно
      if (value == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l10n.invalidNumberFormat),
            duration: const Duration(seconds: 1)));
      } else if (value != null && value <= 0 && mounted)
        // ignore: curly_braces_in_flow_control_structures
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l10n.valueMustBePositive),
            duration: const Duration(seconds: 1)));

      if (mounted) setState(() => _triangle = null);
      return;
    }

    TriangleModel? newTriangle;
    try {
      if (inputFieldName == 'A') {
        newTriangle = TriangleModel.calculateFromA(value);
      } else if (inputFieldName == 'B')
        // ignore: curly_braces_in_flow_control_structures
        newTriangle = TriangleModel.calculateFromB(value);
      else if (inputFieldName == 'C')
        // ignore: curly_braces_in_flow_control_structures
        newTriangle = TriangleModel.calculateFromC(value);

      if (newTriangle != null) {
        // Убедимся, что мы все еще в той же сессии ввода перед обновлением UI и сохранением.
        // Это важно, если расчет занимает время (хотя наш быстрый).
        if (_inputSessionId != sessionIdAtDebounceStart ||
            activeController.text != valueAtDebounceStart) {
          // print("Skipping UI update/save: input session or text changed during async calculation."); // DEBUG
          return;
        }
        // Важно: Сначала обновляем состояние _triangle
        if (mounted) {
          setState(() {
            _triangle = newTriangle;
          });
        }

        // Затем программно обновляем ДРУГИЕ текстовые поля
        // Устанавливаем флаг ПЕРЕД изменением, снимаем ПОСЛЕ
        _isProgrammaticChange = true;
        try {
          // Обновляем ДРУГИЕ поля, активное поле НЕ ТРОГАЕМ (оно источник ввода)
          if (inputFieldName != 'A') {
            final newTextA = newTriangle.sideA.toStringAsFixed(2);
            if (_controllerA.text != newTextA) _controllerA.text = newTextA;
          }
          if (inputFieldName != 'B') {
            final newTextB = newTriangle.sideB.toStringAsFixed(2);
            if (_controllerB.text != newTextB) _controllerB.text = newTextB;
          }
          if (inputFieldName != 'C') {
            final newTextC = newTriangle.sideC.toStringAsFixed(2);
            if (_controllerC.text != newTextC) _controllerC.text = newTextC;
          }
        } finally {
          _isProgrammaticChange = false;
        }

        final historyItem = CalculationHistoryItem(
            inputSideName: inputFieldName,
            inputValue: value,
            sideA: newTriangle.sideA,
            sideB: newTriangle.sideB,
            sideC: newTriangle.sideC,
            area: newTriangle.area,
            perimeter: newTriangle.perimeter,
            timestamp: DateTime.now());
        await _addAndSaveHistoryItem(historyItem);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Не удалось рассчитать треугольник.")));
        }
        if (mounted) setState(() => _triangle = null);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(l10n.errorDuringCalculation(
                  e.toString().replaceFirst("Exception: ", "")))),
        );
      }
      if (mounted) setState(() => _triangle = null);
    }
  }

  void _resetFields() {
    FocusScope.of(context).unfocus();
    _isProgrammaticChange = true;
    _controllerA.clear();
    _controllerB.clear();
    _controllerC.clear();
    _isProgrammaticChange = false;

    if (!mounted) return;
    setState(() {
      _triangle = null;
      _activeInputFieldName = '';
      _inputSessionId++; // Новая сессия после сброса
    });
    _debouncer.dispose();
  }

  @override
  void dispose() {
    _controllerA
        .removeListener(() => _onInputChangedRevised(_controllerA, 'A'));
    _controllerB
        .removeListener(() => _onInputChangedRevised(_controllerB, 'B'));
    _controllerC
        .removeListener(() => _onInputChangedRevised(_controllerC, 'C'));
    _controllerA.dispose();
    _controllerB.dispose();
    _controllerC.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  Widget _buildTextField(
      String labelText, String fieldName, TextEditingController controller) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: l10n.inputSideHint(fieldName),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        // onChanged не нужен здесь, так как мы используем addListener в initState
        // validator можно оставить для визуальной обратной связи при потере фокуса, но основной расчет идет по onChanged
        validator: (value) {
          // Валидатор для обратной связи, если поле теряет фокус с некорректным значением
          if (value != null && value.isNotEmpty) {
            final number = double.tryParse(value);
            if (number == null) return l10n.invalidNumberFormat;
            if (number <= 0) return l10n.valueMustBePositive;
          }
          return null;
        },
        // onEditingComplete или onFieldSubmitted могут быть использованы для запуска расчета,
        // если пользователь нажмет "Готово" на клавиатуре, но у нас уже есть авто-расчет.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    String displayInputSideName =
        _activeInputFieldName; // Используем _activeInputFieldName
    double displayInputValue = 0;

    if (_triangle != null && _activeInputFieldName.isNotEmpty) {
      TextEditingController activeCtrl;
      if (_activeInputFieldName == 'A') {
        activeCtrl = _controllerA;
      } else if (_activeInputFieldName == 'B')
        activeCtrl = _controllerB;
      else
        activeCtrl = _controllerC;
      displayInputValue = double.tryParse(activeCtrl.text) ?? 0;
    }

    List<CalculationHistoryItem> shortHistoryList =
        _history.take(_shortHistoryLimit).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        // Form все еще может быть полезна для валидаторов в TextFormField
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTextField(l10n.sideA, "A", _controllerA),
            _buildTextField(l10n.sideB, "B", _controllerB),
            _buildTextField(l10n.sideC, "C", _controllerC),
            const SizedBox(height: 20),
            // Кнопка Рассчитать УБРАНА
            // Осталась только кнопка Сброс
            Align(
              // Выравниваем кнопку Сброс, например, по центру или по правому краю
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: _resetFields,
                icon: const Icon(Icons.refresh),
                label: Text(l10n.resetButton),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                  foregroundColor: theme.colorScheme.onSecondary,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_triangle != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${l10n.areaLabel}: ${_triangle!.area.toStringAsFixed(2)}',
                            style: theme.textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text(
                            '${l10n.perimeterLabel}: ${_triangle!.perimeter.toStringAsFixed(2)}',
                            style: theme.textTheme.titleMedium),
                        const SizedBox(height: 16),
                        Center(
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: CustomPaint(
                              painter: TrianglePainter(
                                triangle: _triangle!,
                                inputSideName: displayInputSideName,
                                inputValue: displayInputValue,
                                textColor: theme.textTheme.bodyLarge?.color ??
                                    (theme.brightness == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black87),
                                highlightColor: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            if (_isLoadingHistory)
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ))
            else if (shortHistoryList.isNotEmpty)
              HistoryViewWidget(
                historyItems: shortHistoryList,
                onClearHistory: _clearShortHistoryView,
              ),
          ],
        ),
      ),
    );
  }
}
