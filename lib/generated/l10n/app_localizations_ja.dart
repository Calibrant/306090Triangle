// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '30-60-90 三角形計算機';

  @override
  String get calculatorPageTitle => '計算機';

  @override
  String get historyPageTitle => '履歴';

  @override
  String get settingsPageTitle => '設定';

  @override
  String get sideA => '辺 A (30° に対する)';

  @override
  String get sideB => '辺 B (60° に対する)';

  @override
  String get sideC => '辺 C (斜辺)';

  @override
  String inputSideHint(String sideName) {
    return '辺 $sideName を入力';
  }

  @override
  String get calculateButton => '計算';

  @override
  String get resetButton => 'リセット';

  @override
  String get areaLabel => '面積';

  @override
  String get perimeterLabel => '周囲長';

  @override
  String get historySectionTitle => '計算履歴';

  @override
  String get clearHistoryButton => '履歴をクリア';

  @override
  String get inputLabel => '入力';

  @override
  String get resultLabel => '結果';

  @override
  String get timeLabel => '時間';

  @override
  String get valueMustBePositive => '値は 0 より大きくなければなりません';

  @override
  String get invalidNumberFormat => '無効な数値形式';

  @override
  String get pleaseEnterValue => '値を入力してください';

  @override
  String errorDuringCalculation(Object error) {
    return '計算中にエラー: $error';
  }

  @override
  String get confirmClearHistoryTitle => '確認';

  @override
  String get confirmClearHistoryContent => '計算履歴をクリアしますか？';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get clearButton => 'クリア';

  @override
  String get historyCleared => '履歴がクリアされました';

  @override
  String get fixInputErrors => '入力フィールドのエラーを修正してください。';

  @override
  String get enterPositiveNumberForSide => 'いずれかの辺に正しい正の数を入力してください。';

  @override
  String get settingsTitle => '設定';

  @override
  String get appearanceSectionTitle => '外観';

  @override
  String get themeSettingTitle => 'テーマ';

  @override
  String get lightTheme => 'ライト';

  @override
  String get darkTheme => 'ダーク';

  @override
  String get systemTheme => 'システム';

  @override
  String get languageSettingTitle => '言語';

  @override
  String get englishLanguage => '英語';

  @override
  String get russianLanguage => 'ロシア語';

  @override
  String get germanLanguage => 'ドイツ語';

  @override
  String get spanishLanguage => 'スペイン語';

  @override
  String get frenchLanguage => 'フランス語';

  @override
  String get indianLanguage => 'インド語';

  @override
  String get indonesianLanguage => 'インドネシア語';

  @override
  String get japaneseLanguage => '日本語';

  @override
  String get koreanLanguage => '韓国語';

  @override
  String get portugueseLanguage => 'ポルトガル語';

  @override
  String get systemLanguage => 'システムデフォルト';

  @override
  String get aboutSectionTitle => '概要';

  @override
  String get aboutApp => 'アプリについて';

  @override
  String get feedback => 'フィードバック';

  @override
  String get shareApp => 'アプリを共有';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get version => 'バージョン';

  @override
  String get shareCalculation => '計算を共有';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return '計算の詳細:\n入力: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\n面積: $area, 周囲長: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'ページ開発中';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'URLを開けませんでした: $url';
  }

  @override
  String get appDescription => '30-60-90 三角形のためのシンプルな計算機。';

  @override
  String get appDescriptionMoreDetails =>
      'このアプリケーションは、既知の1辺に基づいて30-60-90直角三角形のすべての辺、面積、周囲長を迅速に計算するのに役立ちます。また、計算履歴を簡単な参照のために保存します。Flutterで開発。';

  @override
  String get versionInfoIconLabel => 'バージョン情報';

  @override
  String get emptyHistoryPlaceholder => '履歴が空です。';

  @override
  String get swipeDownToRefreshHint => '履歴を更新またはロードするには下にスワイプしてください。';
}
