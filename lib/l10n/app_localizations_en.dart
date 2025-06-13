// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => '30-60-90 Triangle Calculator';

  @override
  String get calculatorPageTitle => 'Calculator';

  @override
  String get historyPageTitle => 'History';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get sideA => 'Side A (vs 30°)';

  @override
  String get sideB => 'Side B (vs 60°)';

  @override
  String get sideC => 'Side C (Hypotenuse)';

  @override
  String inputSideHint(String sideName) {
    return 'Enter side $sideName';
  }

  @override
  String get calculateButton => 'Calculate';

  @override
  String get resetButton => 'Reset';

  @override
  String get areaLabel => 'Area';

  @override
  String get perimeterLabel => 'Perimeter';

  @override
  String get historySectionTitle => 'Calculation History';

  @override
  String get clearHistoryButton => 'Clear History';

  @override
  String get emptyHistoryPlaceholder => 'History is empty.';

  @override
  String get inputLabel => 'Input';

  @override
  String get resultLabel => 'Result';

  @override
  String get timeLabel => 'Time';

  @override
  String get valueMustBePositive => 'Value must be greater than 0';

  @override
  String get invalidNumberFormat => 'Invalid number format';

  @override
  String get pleaseEnterValue => 'Please enter a value';

  @override
  String errorDuringCalculation(Object error) {
    return 'Error during calculation: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Confirm';

  @override
  String get confirmClearHistoryContent =>
      'Are you sure you want to clear the calculation history?';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get clearButton => 'Clear';

  @override
  String get historyCleared => 'History cleared';

  @override
  String get fixInputErrors => 'Please fix errors in input fields.';

  @override
  String get enterPositiveNumberForSide =>
      'Please enter a correct positive number for one of the sides.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appearanceSectionTitle => 'Appearance';

  @override
  String get themeSettingTitle => 'Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';

  @override
  String get languageSettingTitle => 'Language';

  @override
  String get englishLanguage => 'English';

  @override
  String get russianLanguage => 'Russian';

  @override
  String get systemLanguage => 'System Default';

  @override
  String get aboutSectionTitle => 'About';

  @override
  String get aboutApp => 'About App';

  @override
  String get feedback => 'Feedback';

  @override
  String get shareApp => 'Share App';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get version => 'Version';

  @override
  String get shareCalculation => 'Share Calculation';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Calculation Details:\nInput: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nArea: $area, Perimeter: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Page under development';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'Could not launch $url';
  }

  @override
  String get appDescription => 'A simple calculator for 30-60-90 triangles.';

  @override
  String get appDescriptionMoreDetails =>
      'This application helps you quickly calculate all sides, area, and perimeter of a 30-60-90 right triangle based on one known side. It also keeps a history of your calculations for easy reference. Developed with Flutter.';

  @override
  String get versionInfoIconLabel => 'Version Information';

  @override
  String get swipeDownToRefreshHint => 'Swipe down to refresh or load history.';
}
