// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => '30-60-90 त्रिभुज कैलकुलेटर';

  @override
  String get calculatorPageTitle => 'कैलकुलेटर';

  @override
  String get historyPageTitle => 'इतिहास';

  @override
  String get settingsPageTitle => 'सेटिंग्स';

  @override
  String get sideA => 'भुजा A (30° के सामने)';

  @override
  String get sideB => 'भुजा B (60° के सामने)';

  @override
  String get sideC => 'भुजा C (कर्ण)';

  @override
  String inputSideHint(String sideName) {
    return 'भुजा $sideName दर्ज करें';
  }

  @override
  String get calculateButton => 'गणना करें';

  @override
  String get resetButton => 'रीसेट करें';

  @override
  String get areaLabel => 'क्षेत्रफल';

  @override
  String get perimeterLabel => 'परिमाप';

  @override
  String get historySectionTitle => 'गणना इतिहास';

  @override
  String get clearHistoryButton => 'इतिहास साफ़ करें';

  @override
  String get inputLabel => 'इनपुट';

  @override
  String get resultLabel => 'परिणाम';

  @override
  String get timeLabel => 'समय';

  @override
  String get valueMustBePositive => 'मान 0 से बड़ा होना चाहिए';

  @override
  String get invalidNumberFormat => 'अमान्य संख्या प्रारूप';

  @override
  String get pleaseEnterValue => 'कृपया एक मान दर्ज करें';

  @override
  String errorDuringCalculation(Object error) {
    return 'गणना के दौरान त्रुटि: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'पुष्टि करें';

  @override
  String get confirmClearHistoryContent =>
      'क्या आप वाकई गणना इतिहास साफ़ करना चाहते हैं?';

  @override
  String get cancelButton => 'रद्द करें';

  @override
  String get clearButton => 'साफ़ करें';

  @override
  String get historyCleared => 'इतिहास साफ़ हो गया';

  @override
  String get fixInputErrors => 'कृपया इनपुट फ़ील्ड में त्रुटियों को ठीक करें।';

  @override
  String get enterPositiveNumberForSide =>
      'कृपया किसी एक भुजा के लिए सही धनात्मक संख्या दर्ज करें।';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get appearanceSectionTitle => 'रूप';

  @override
  String get themeSettingTitle => 'थीम';

  @override
  String get lightTheme => 'हल्का';

  @override
  String get darkTheme => 'गहरा';

  @override
  String get systemTheme => 'सिस्टम';

  @override
  String get languageSettingTitle => 'भाषा';

  @override
  String get englishLanguage => 'अंग्रेजी';

  @override
  String get russianLanguage => 'रूसी';

  @override
  String get germanLanguage => 'जर्मन';

  @override
  String get spanishLanguage => 'स्पेनिश';

  @override
  String get frenchLanguage => 'फ्रेंच';

  @override
  String get indianLanguage => 'हिन्दी';

  @override
  String get indonesianLanguage => 'इंडोनेशियाई';

  @override
  String get japaneseLanguage => 'जापानी';

  @override
  String get koreanLanguage => 'कोरियाई';

  @override
  String get portugueseLanguage => 'पुर्तगाली';

  @override
  String get systemLanguage => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get aboutSectionTitle => 'के बारे में';

  @override
  String get aboutApp => 'ऐप के बारे में';

  @override
  String get feedback => 'प्रतिक्रिया';

  @override
  String get shareApp => 'ऐप साझा करें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get version => 'संस्करण';

  @override
  String get shareCalculation => 'गणना साझा करें';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'गणना विवरण:\nइनपुट: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nक्षेत्रफल: $area, परिमाप: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'पृष्ठ विकासाधीन है';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'URL लॉन्च नहीं किया जा सका: $url';
  }

  @override
  String get appDescription => '30-60-90 त्रिभुजों के लिए एक साधारण कैलकुलेटर।';

  @override
  String get appDescriptionMoreDetails =>
      'यह एप्लिकेशन आपको एक ज्ञात भुजा के आधार पर 30-60-90 समकोण त्रिभुज के सभी पक्षों, क्षेत्रफल और परिमाप की त्वरित गणना करने में मदद करता है। यह आपके गणनाओं का इतिहास भी आसान संदर्भ के लिए रखता है। फ्लटर के साथ विकसित।';

  @override
  String get versionInfoIconLabel => 'संस्करण जानकारी';

  @override
  String get emptyHistoryPlaceholder => 'इतिहास खाली है।';

  @override
  String get swipeDownToRefreshHint =>
      'इतिहास को रीफ्रेश करने या लोड करने के लिए नीचे स्वाइप करें।';
}
