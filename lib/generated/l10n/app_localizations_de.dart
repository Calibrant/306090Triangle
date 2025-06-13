// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => '30-60-90 Dreieck-Rechner';

  @override
  String get calculatorPageTitle => 'Rechner';

  @override
  String get historyPageTitle => 'Verlauf';

  @override
  String get settingsPageTitle => 'Einstellungen';

  @override
  String get sideA => 'Seite A (gegenüber 30°)';

  @override
  String get sideB => 'Seite B (gegenüber 60°)';

  @override
  String get sideC => 'Seite C (Hypotenuse)';

  @override
  String inputSideHint(String sideName) {
    return 'Seite $sideName eingeben';
  }

  @override
  String get calculateButton => 'Berechnen';

  @override
  String get resetButton => 'Zurücksetzen';

  @override
  String get areaLabel => 'Fläche';

  @override
  String get perimeterLabel => 'Umfang';

  @override
  String get historySectionTitle => 'Berechnungsverlauf';

  @override
  String get clearHistoryButton => 'Verlauf löschen';

  @override
  String get inputLabel => 'Eingabe';

  @override
  String get resultLabel => 'Ergebnis';

  @override
  String get timeLabel => 'Zeit';

  @override
  String get valueMustBePositive => 'Wert muss größer als 0 sein';

  @override
  String get invalidNumberFormat => 'Ungültiges Zahlenformat';

  @override
  String get pleaseEnterValue => 'Bitte einen Wert eingeben';

  @override
  String errorDuringCalculation(Object error) {
    return 'Fehler bei der Berechnung: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Bestätigen';

  @override
  String get confirmClearHistoryContent =>
      'Sind Sie sicher, dass Sie den Berechnungsverlauf löschen möchten?';

  @override
  String get cancelButton => 'Abbrechen';

  @override
  String get clearButton => 'Löschen';

  @override
  String get historyCleared => 'Verlauf gelöscht';

  @override
  String get fixInputErrors =>
      'Bitte beheben Sie die Fehler in den Eingabefeldern.';

  @override
  String get enterPositiveNumberForSide =>
      'Bitte geben Sie eine korrekte positive Zahl für eine der Seiten ein.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get appearanceSectionTitle => 'Aussehen';

  @override
  String get themeSettingTitle => 'Thema';

  @override
  String get lightTheme => 'Hell';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String get systemTheme => 'System';

  @override
  String get languageSettingTitle => 'Sprache';

  @override
  String get englishLanguage => 'Englisch';

  @override
  String get russianLanguage => 'Russisch';

  @override
  String get germanLanguage => 'Deutsch';

  @override
  String get spanishLanguage => 'Spanisch';

  @override
  String get frenchLanguage => 'Französisch';

  @override
  String get indianLanguage => 'Indisch';

  @override
  String get indonesianLanguage => 'Indonesisch';

  @override
  String get japaneseLanguage => 'Japanisch';

  @override
  String get koreanLanguage => 'Koreanisch';

  @override
  String get portugueseLanguage => 'Portugiesisch';

  @override
  String get systemLanguage => 'Systemstandard';

  @override
  String get aboutSectionTitle => 'Über';

  @override
  String get aboutApp => 'Über die App';

  @override
  String get feedback => 'Feedback';

  @override
  String get shareApp => 'App teilen';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get version => 'Version';

  @override
  String get shareCalculation => 'Berechnung teilen';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Berechnungsdetails:\nEingabe: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nFläche: $area, Umfang: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Seite in Entwicklung';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'URL konnte nicht geöffnet werden: $url';
  }

  @override
  String get appDescription => 'Ein einfacher Rechner für 30-60-90 Dreiecke.';

  @override
  String get appDescriptionMoreDetails =>
      'Diese Anwendung hilft Ihnen, schnell alle Seiten, die Fläche und den Umfang eines 30-60-90 rechtwinkligen Dreiecks basierend auf einer bekannten Seite zu berechnen. Sie speichert auch einen Verlauf Ihrer Berechnungen für einfache Referenz. Entwickelt mit Flutter.';

  @override
  String get versionInfoIconLabel => 'Versionsinformationen';

  @override
  String get emptyHistoryPlaceholder => 'Verlauf ist leer.';

  @override
  String get swipeDownToRefreshHint =>
      'Zum Aktualisieren oder Laden des Verlaufs nach unten wischen.';
}
