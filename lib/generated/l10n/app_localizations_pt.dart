// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Calculadora de Triângulo 30-60-90';

  @override
  String get calculatorPageTitle => 'Calculadora';

  @override
  String get historyPageTitle => 'Histórico';

  @override
  String get settingsPageTitle => 'Configurações';

  @override
  String get sideA => 'Lado A (oposto a 30°)';

  @override
  String get sideB => 'Lado B (oposto a 60°)';

  @override
  String get sideC => 'Lado C (Hipotenusa)';

  @override
  String inputSideHint(String sideName) {
    return 'Insira o lado $sideName';
  }

  @override
  String get calculateButton => 'Calcular';

  @override
  String get resetButton => 'Redefinir';

  @override
  String get areaLabel => 'Área';

  @override
  String get perimeterLabel => 'Perímetro';

  @override
  String get historySectionTitle => 'Histórico de Cálculos';

  @override
  String get clearHistoryButton => 'Limpar Histórico';

  @override
  String get inputLabel => 'Entrada';

  @override
  String get resultLabel => 'Resultado';

  @override
  String get timeLabel => 'Hora';

  @override
  String get valueMustBePositive => 'O valor deve ser maior que 0';

  @override
  String get invalidNumberFormat => 'Formato de número inválido';

  @override
  String get pleaseEnterValue => 'Por favor, insira um valor';

  @override
  String errorDuringCalculation(Object error) {
    return 'Erro durante o cálculo: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Confirmar';

  @override
  String get confirmClearHistoryContent =>
      'Tem certeza de que deseja limpar o histórico de cálculos?';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get clearButton => 'Limpar';

  @override
  String get historyCleared => 'Histórico limpo';

  @override
  String get fixInputErrors =>
      'Por favor, corrija os erros nos campos de entrada.';

  @override
  String get enterPositiveNumberForSide =>
      'Por favor, insira um número positivo correto para um dos lados.';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get appearanceSectionTitle => 'Aparência';

  @override
  String get themeSettingTitle => 'Tema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Escuro';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get languageSettingTitle => 'Idioma';

  @override
  String get englishLanguage => 'Inglês';

  @override
  String get russianLanguage => 'Russo';

  @override
  String get germanLanguage => 'Alemão';

  @override
  String get spanishLanguage => 'Espanhol';

  @override
  String get frenchLanguage => 'Francês';

  @override
  String get indianLanguage => 'Hindi';

  @override
  String get indonesianLanguage => 'Indonésio';

  @override
  String get japaneseLanguage => 'Japonês';

  @override
  String get koreanLanguage => 'Coreano';

  @override
  String get portugueseLanguage => 'Português';

  @override
  String get systemLanguage => 'Padrão do Sistema';

  @override
  String get aboutSectionTitle => 'Sobre';

  @override
  String get aboutApp => 'Sobre o App';

  @override
  String get feedback => 'Feedback';

  @override
  String get shareApp => 'Compartilhar App';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get version => 'Versão';

  @override
  String get shareCalculation => 'Compartilhar Cálculo';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Detalhes do Cálculo:\nEntrada: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nÁrea: $area, Perímetro: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Página em desenvolvimento';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'Não foi possível abrir a URL: $url';
  }

  @override
  String get appDescription =>
      'Uma calculadora simples para triângulos 30-60-90.';

  @override
  String get appDescriptionMoreDetails =>
      'Este aplicativo ajuda você a calcular rapidamente todos os lados, a área e o perímetro de um triângulo retângulo 30-60-90 com base em um lado conhecido. Ele também mantém um histórico dos seus cálculos para referência fácil. Desenvolvido com Flutter.';

  @override
  String get versionInfoIconLabel => 'Informações da Versão';

  @override
  String get emptyHistoryPlaceholder => 'O histórico está vazio.';

  @override
  String get swipeDownToRefreshHint =>
      'Deslize para baixo para atualizar ou carregar o histórico.';
}
