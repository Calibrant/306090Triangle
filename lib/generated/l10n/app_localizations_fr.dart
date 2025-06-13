// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Calculateur de Triangle 30-60-90';

  @override
  String get calculatorPageTitle => 'Calculateur';

  @override
  String get historyPageTitle => 'Historique';

  @override
  String get settingsPageTitle => 'Paramètres';

  @override
  String get sideA => 'Côté A (opposé à 30°)';

  @override
  String get sideB => 'Côté B (opposé à 60°)';

  @override
  String get sideC => 'Côté C (Hypoténuse)';

  @override
  String inputSideHint(String sideName) {
    return 'Entrez le côté $sideName';
  }

  @override
  String get calculateButton => 'Calculer';

  @override
  String get resetButton => 'Réinitialiser';

  @override
  String get areaLabel => 'Aire';

  @override
  String get perimeterLabel => 'Périmètre';

  @override
  String get historySectionTitle => 'Historique des Calculs';

  @override
  String get clearHistoryButton => 'Effacer l\'Historique';

  @override
  String get inputLabel => 'Entrée';

  @override
  String get resultLabel => 'Résultat';

  @override
  String get timeLabel => 'Heure';

  @override
  String get valueMustBePositive => 'La valeur doit être supérieure à 0';

  @override
  String get invalidNumberFormat => 'Format de nombre invalide';

  @override
  String get pleaseEnterValue => 'Veuillez entrer une valeur';

  @override
  String errorDuringCalculation(Object error) {
    return 'Erreur lors du calcul : $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Confirmer';

  @override
  String get confirmClearHistoryContent =>
      'Êtes-vous sûr de vouloir effacer l\'historique des calculs ?';

  @override
  String get cancelButton => 'Annuler';

  @override
  String get clearButton => 'Effacer';

  @override
  String get historyCleared => 'Historique effacé';

  @override
  String get fixInputErrors =>
      'Veuillez corriger les erreurs dans les champs de saisie.';

  @override
  String get enterPositiveNumberForSide =>
      'Veuillez entrer un nombre positif correct pour l\'un des côtés.';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get appearanceSectionTitle => 'Apparence';

  @override
  String get themeSettingTitle => 'Thème';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get systemTheme => 'Système';

  @override
  String get languageSettingTitle => 'Langue';

  @override
  String get englishLanguage => 'Anglais';

  @override
  String get russianLanguage => 'Russe';

  @override
  String get germanLanguage => 'Allemand';

  @override
  String get spanishLanguage => 'Espagnol';

  @override
  String get frenchLanguage => 'Français';

  @override
  String get indianLanguage => 'Indien';

  @override
  String get indonesianLanguage => 'Indonésien';

  @override
  String get japaneseLanguage => 'Japonais';

  @override
  String get koreanLanguage => 'Coréen';

  @override
  String get portugueseLanguage => 'Portugais';

  @override
  String get systemLanguage => 'Par défaut du système';

  @override
  String get aboutSectionTitle => 'À propos';

  @override
  String get aboutApp => 'À propos de l\'App';

  @override
  String get feedback => 'Commentaires';

  @override
  String get shareApp => 'Partager l\'App';

  @override
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get version => 'Version';

  @override
  String get shareCalculation => 'Partager le Calcul';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Détails du Calcul :\nEntrée : $inputSideName = $inputValue\nA : $sideA, B : $sideB, C : $sideC\nAire : $area, Périmètre : $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Page en cours de développement';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'Impossible d\'ouvrir l\'URL : $url';
  }

  @override
  String get appDescription =>
      'Un calculateur simple pour les triangles 30-60-90.';

  @override
  String get appDescriptionMoreDetails =>
      'Cette application vous aide à calculer rapidement tous les côtés, l\'aire et le périmètre d\'un triangle rectangle 30-60-90 en fonction d\'un côté connu. Elle conserve également un historique de vos calculs pour une référence facile. Développé avec Flutter.';

  @override
  String get versionInfoIconLabel => 'Informations sur la Version';

  @override
  String get emptyHistoryPlaceholder => 'L\'historique est vide.';

  @override
  String get swipeDownToRefreshHint =>
      'Faites glisser vers le bas pour actualiser ou charger l\'historique.';
}
