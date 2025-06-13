// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '30-60-90 삼각형 계산기';

  @override
  String get calculatorPageTitle => '계산기';

  @override
  String get historyPageTitle => '기록';

  @override
  String get settingsPageTitle => '설정';

  @override
  String get sideA => '변 A (30°에 대응)';

  @override
  String get sideB => '변 B (60°에 대응)';

  @override
  String get sideC => '변 C (빗변)';

  @override
  String inputSideHint(String sideName) {
    return '변 $sideName 입력';
  }

  @override
  String get calculateButton => '계산';

  @override
  String get resetButton => '초기화';

  @override
  String get areaLabel => '면적';

  @override
  String get perimeterLabel => '둘레';

  @override
  String get historySectionTitle => '계산 기록';

  @override
  String get clearHistoryButton => '기록 지우기';

  @override
  String get inputLabel => '입력';

  @override
  String get resultLabel => '결과';

  @override
  String get timeLabel => '시간';

  @override
  String get valueMustBePositive => '값은 0보다 커야 합니다';

  @override
  String get invalidNumberFormat => '잘못된 숫자 형식';

  @override
  String get pleaseEnterValue => '값을 입력하세요';

  @override
  String errorDuringCalculation(Object error) {
    return '계산 중 오류: $error';
  }

  @override
  String get confirmClearHistoryTitle => '확인';

  @override
  String get confirmClearHistoryContent => '계산 기록을 지우시겠습니까?';

  @override
  String get cancelButton => '취소';

  @override
  String get clearButton => '지우기';

  @override
  String get historyCleared => '기록이 지워졌습니다';

  @override
  String get fixInputErrors => '입력 필드의 오류를 수정하세요.';

  @override
  String get enterPositiveNumberForSide => '한 변에 대해 올바른 양수를 입력하세요.';

  @override
  String get settingsTitle => '설정';

  @override
  String get appearanceSectionTitle => '외관';

  @override
  String get themeSettingTitle => '테마';

  @override
  String get lightTheme => '밝음';

  @override
  String get darkTheme => '어두움';

  @override
  String get systemTheme => '시스템';

  @override
  String get languageSettingTitle => '언어';

  @override
  String get englishLanguage => '영어';

  @override
  String get russianLanguage => '러시아어';

  @override
  String get germanLanguage => '독일어';

  @override
  String get spanishLanguage => '스페인어';

  @override
  String get frenchLanguage => '프랑스어';

  @override
  String get indianLanguage => '인도어';

  @override
  String get indonesianLanguage => '인도네시아어';

  @override
  String get japaneseLanguage => '일본어';

  @override
  String get koreanLanguage => '한국어';

  @override
  String get portugueseLanguage => '포르투갈어';

  @override
  String get systemLanguage => '시스템 기본값';

  @override
  String get aboutSectionTitle => '정보';

  @override
  String get aboutApp => '앱 정보';

  @override
  String get feedback => '피드백';

  @override
  String get shareApp => '앱 공유';

  @override
  String get privacyPolicy => '개인정보 보호정책';

  @override
  String get version => '버전';

  @override
  String get shareCalculation => '계산 공유';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return '계산 세부 정보:\n입력: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\n면적: $area, 둘레: $perimeter';
  }

  @override
  String get pageUnderDevelopment => '페이지 개발 중';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'URL을 열 수 없습니다: $url';
  }

  @override
  String get appDescription => '30-60-90 삼각형을 위한 간단한 계산기.';

  @override
  String get appDescriptionMoreDetails =>
      '이 애플리케이션은 알려진 한 변을 기반으로 30-60-90 직각 삼각형의 모든 변, 면적, 둘레를 빠르게 계산할 수 있도록 도와줍니다. 또한 계산 기록을 쉽게 참조할 수 있도록 저장합니다. Flutter로 개발됨.';

  @override
  String get versionInfoIconLabel => '버전 정보';

  @override
  String get emptyHistoryPlaceholder => '기록이 비어 있습니다.';

  @override
  String get swipeDownToRefreshHint => '기록을 새로 고침하거나 로드하려면 아래로 스와이프하세요.';
}
