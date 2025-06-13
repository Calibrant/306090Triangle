import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'30-60-90 Triangle Calculator'**
  String get appTitle;

  /// No description provided for @calculatorPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get calculatorPageTitle;

  /// No description provided for @historyPageTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyPageTitle;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @sideA.
  ///
  /// In en, this message translates to:
  /// **'Side A (vs 30°)'**
  String get sideA;

  /// No description provided for @sideB.
  ///
  /// In en, this message translates to:
  /// **'Side B (vs 60°)'**
  String get sideB;

  /// No description provided for @sideC.
  ///
  /// In en, this message translates to:
  /// **'Side C (Hypotenuse)'**
  String get sideC;

  /// Hint for input field
  ///
  /// In en, this message translates to:
  /// **'Enter side {sideName}'**
  String inputSideHint(String sideName);

  /// No description provided for @calculateButton.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculateButton;

  /// No description provided for @resetButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButton;

  /// No description provided for @areaLabel.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get areaLabel;

  /// No description provided for @perimeterLabel.
  ///
  /// In en, this message translates to:
  /// **'Perimeter'**
  String get perimeterLabel;

  /// No description provided for @historySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Calculation History'**
  String get historySectionTitle;

  /// No description provided for @clearHistoryButton.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistoryButton;

  /// No description provided for @inputLabel.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get inputLabel;

  /// No description provided for @resultLabel.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get resultLabel;

  /// No description provided for @timeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeLabel;

  /// No description provided for @valueMustBePositive.
  ///
  /// In en, this message translates to:
  /// **'Value must be greater than 0'**
  String get valueMustBePositive;

  /// No description provided for @invalidNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid number format'**
  String get invalidNumberFormat;

  /// No description provided for @pleaseEnterValue.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value'**
  String get pleaseEnterValue;

  /// No description provided for @errorDuringCalculation.
  ///
  /// In en, this message translates to:
  /// **'Error during calculation: {error}'**
  String errorDuringCalculation(Object error);

  /// No description provided for @confirmClearHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmClearHistoryTitle;

  /// No description provided for @confirmClearHistoryContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear the calculation history?'**
  String get confirmClearHistoryContent;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @clearButton.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearButton;

  /// No description provided for @historyCleared.
  ///
  /// In en, this message translates to:
  /// **'History cleared'**
  String get historyCleared;

  /// No description provided for @fixInputErrors.
  ///
  /// In en, this message translates to:
  /// **'Please fix errors in input fields.'**
  String get fixInputErrors;

  /// No description provided for @enterPositiveNumberForSide.
  ///
  /// In en, this message translates to:
  /// **'Please enter a correct positive number for one of the sides.'**
  String get enterPositiveNumberForSide;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @appearanceSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceSectionTitle;

  /// No description provided for @themeSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeSettingTitle;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @languageSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSettingTitle;

  /// No description provided for @englishLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @russianLanguage.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russianLanguage;

  /// No description provided for @germanLanguage.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get germanLanguage;

  /// No description provided for @spanishLanguage.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanishLanguage;

  /// No description provided for @frenchLanguage.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get frenchLanguage;

  /// No description provided for @indianLanguage.
  ///
  /// In en, this message translates to:
  /// **'Indian'**
  String get indianLanguage;

  /// No description provided for @indonesianLanguage.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get indonesianLanguage;

  /// No description provided for @japaneseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japaneseLanguage;

  /// No description provided for @koreanLanguage.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get koreanLanguage;

  /// No description provided for @portugueseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portugueseLanguage;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemLanguage;

  /// No description provided for @aboutSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSectionTitle;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @shareCalculation.
  ///
  /// In en, this message translates to:
  /// **'Share Calculation'**
  String get shareCalculation;

  /// No description provided for @calculationDetails.
  ///
  /// In en, this message translates to:
  /// **'Calculation Details:\nInput: {inputSideName} = {inputValue}\nA: {sideA}, B: {sideB}, C: {sideC}\nArea: {area}, Perimeter: {perimeter}'**
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter);

  /// No description provided for @pageUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Page under development'**
  String get pageUnderDevelopment;

  /// No description provided for @couldNotLaunchUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not launch {url}'**
  String couldNotLaunchUrl(Object url);

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'A simple calculator for 30-60-90 triangles.'**
  String get appDescription;

  /// No description provided for @appDescriptionMoreDetails.
  ///
  /// In en, this message translates to:
  /// **'This application helps you quickly calculate all sides, area, and perimeter of a 30-60-90 right triangle based on one known side. It also keeps a history of your calculations for easy reference. Developed with Flutter.'**
  String get appDescriptionMoreDetails;

  /// No description provided for @versionInfoIconLabel.
  ///
  /// In en, this message translates to:
  /// **'Version Information'**
  String get versionInfoIconLabel;

  /// No description provided for @emptyHistoryPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'History is empty.'**
  String get emptyHistoryPlaceholder;

  /// No description provided for @swipeDownToRefreshHint.
  ///
  /// In en, this message translates to:
  /// **'Swipe down to refresh or load history.'**
  String get swipeDownToRefreshHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'ja',
        'ko',
        'pt',
        'ru'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
