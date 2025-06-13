// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Калькулятор 30-60-90';

  @override
  String get calculatorPageTitle => 'Калькулятор';

  @override
  String get historyPageTitle => 'История';

  @override
  String get settingsPageTitle => 'Настройки';

  @override
  String get sideA => 'Сторона A (против 30°)';

  @override
  String get sideB => 'Сторона B (против 60°)';

  @override
  String get sideC => 'Сторона C (Гипотенуза)';

  @override
  String inputSideHint(String sideName) {
    return 'Введите сторону $sideName';
  }

  @override
  String get calculateButton => 'Рассчитать';

  @override
  String get resetButton => 'Сброс';

  @override
  String get areaLabel => 'Площадь';

  @override
  String get perimeterLabel => 'Периметр';

  @override
  String get historySectionTitle => 'История вычислений';

  @override
  String get clearHistoryButton => 'Очистить историю';

  @override
  String get emptyHistoryPlaceholder => 'История пока пуста.';

  @override
  String get inputLabel => 'Вход';

  @override
  String get resultLabel => 'Результат';

  @override
  String get timeLabel => 'Время';

  @override
  String get valueMustBePositive => 'Значение должно быть > 0';

  @override
  String get invalidNumberFormat => 'Некорректный формат числа';

  @override
  String get pleaseEnterValue => 'Пожалуйста, введите значение';

  @override
  String errorDuringCalculation(Object error) {
    return 'Ошибка при расчете: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Подтверждение';

  @override
  String get confirmClearHistoryContent =>
      'Вы уверены, что хотите очистить историю вычислений?';

  @override
  String get cancelButton => 'Отмена';

  @override
  String get clearButton => 'Очистить';

  @override
  String get historyCleared => 'История очищена';

  @override
  String get fixInputErrors => 'Пожалуйста, исправьте ошибки в полях ввода.';

  @override
  String get enterPositiveNumberForSide =>
      'Пожалуйста, введите корректное положительное число для одной из сторон.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get appearanceSectionTitle => 'Внешний вид';

  @override
  String get themeSettingTitle => 'Тема';

  @override
  String get lightTheme => 'Светлая';

  @override
  String get darkTheme => 'Темная';

  @override
  String get systemTheme => 'Системная';

  @override
  String get languageSettingTitle => 'Язык';

  @override
  String get englishLanguage => 'Английский';

  @override
  String get russianLanguage => 'Русский';

  @override
  String get systemLanguage => 'Системный по умолчанию';

  @override
  String get aboutSectionTitle => 'О приложении';

  @override
  String get aboutApp => 'О приложении';

  @override
  String get feedback => 'Обратная связь';

  @override
  String get shareApp => 'Поделиться приложением';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get version => 'Версия';

  @override
  String get shareCalculation => 'Поделиться расчетом';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Детали расчета:\nВход: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nПлощадь: $area, Периметр: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Страница в разработке';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'Не удалось открыть $url';
  }

  @override
  String get appDescription =>
      'Простой калькулятор для треугольников 30-60-90.';

  @override
  String get appDescriptionMoreDetails =>
      'Это приложение поможет вам быстро рассчитать все стороны, площадь и периметр прямоугольного треугольника 30-60-90 по одной известной стороне. Оно также сохраняет историю ваших вычислений для удобства. Разработано с использованием Flutter.';

  @override
  String get versionInfoIconLabel => 'Информация о версии';

  @override
  String get swipeDownToRefreshHint =>
      'Потяните вниз, чтобы обновить или загрузить историю.';
}
