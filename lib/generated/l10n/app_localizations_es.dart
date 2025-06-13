// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Calculadora de Triángulos 30-60-90';

  @override
  String get calculatorPageTitle => 'Calculadora';

  @override
  String get historyPageTitle => 'Historial';

  @override
  String get settingsPageTitle => 'Configuración';

  @override
  String get sideA => 'Lado A (opuesto a 30°)';

  @override
  String get sideB => 'Lado B (opuesto a 60°)';

  @override
  String get sideC => 'Lado C (Hipotenusa)';

  @override
  String inputSideHint(String sideName) {
    return 'Ingrese el lado $sideName';
  }

  @override
  String get calculateButton => 'Calcular';

  @override
  String get resetButton => 'Restablecer';

  @override
  String get areaLabel => 'Área';

  @override
  String get perimeterLabel => 'Perímetro';

  @override
  String get historySectionTitle => 'Historial de Cálculos';

  @override
  String get clearHistoryButton => 'Borrar Historial';

  @override
  String get inputLabel => 'Entrada';

  @override
  String get resultLabel => 'Resultado';

  @override
  String get timeLabel => 'Hora';

  @override
  String get valueMustBePositive => 'El valor debe ser mayor que 0';

  @override
  String get invalidNumberFormat => 'Formato de número inválido';

  @override
  String get pleaseEnterValue => 'Por favor, ingrese un valor';

  @override
  String errorDuringCalculation(Object error) {
    return 'Error durante el cálculo: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Confirmar';

  @override
  String get confirmClearHistoryContent =>
      '¿Está seguro de que desea borrar el historial de cálculos?';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get clearButton => 'Borrar';

  @override
  String get historyCleared => 'Historial borrado';

  @override
  String get fixInputErrors =>
      'Por favor, corrija los errores en los campos de entrada.';

  @override
  String get enterPositiveNumberForSide =>
      'Por favor, ingrese un número positivo correcto para uno de los lados.';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get appearanceSectionTitle => 'Apariencia';

  @override
  String get themeSettingTitle => 'Tema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get languageSettingTitle => 'Idioma';

  @override
  String get englishLanguage => 'Inglés';

  @override
  String get russianLanguage => 'Ruso';

  @override
  String get germanLanguage => 'Alemán';

  @override
  String get spanishLanguage => 'Español';

  @override
  String get frenchLanguage => 'Francés';

  @override
  String get indianLanguage => 'Indio';

  @override
  String get indonesianLanguage => 'Indonesio';

  @override
  String get japaneseLanguage => 'Japonés';

  @override
  String get koreanLanguage => 'Coreano';

  @override
  String get portugueseLanguage => 'Portugués';

  @override
  String get systemLanguage => 'Predeterminado del sistema';

  @override
  String get aboutSectionTitle => 'Acerca de';

  @override
  String get aboutApp => 'Acerca de la App';

  @override
  String get feedback => 'Comentarios';

  @override
  String get shareApp => 'Compartir App';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get version => 'Version';

  @override
  String get shareCalculation => 'Compartir Cálculo';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Detalles del Cálculo:\nEntrada: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nÁrea: $area, Perímetro: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Página en desarrollo';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'No se pudo abrir la URL: $url';
  }

  @override
  String get appDescription =>
      'Una calculadora simple para triángulos 30-60-90.';

  @override
  String get appDescriptionMoreDetails =>
      'Esta aplicación le ayuda a calcular rápidamente todos los lados, el área y el perímetro de un triángulo rectángulo 30-60-90 basándose en un lado conocido. También mantiene un historial de sus cálculos para una referencia fácil. Desarrollado con Flutter.';

  @override
  String get versionInfoIconLabel => 'Información de la Versión';

  @override
  String get emptyHistoryPlaceholder => 'El historial está vacío.';

  @override
  String get swipeDownToRefreshHint =>
      'Deslice hacia abajo para actualizar o cargar el historial.';
}
