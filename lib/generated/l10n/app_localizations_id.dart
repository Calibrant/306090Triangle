// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Kalkulator Segitiga 30-60-90';

  @override
  String get calculatorPageTitle => 'Kalkulator';

  @override
  String get historyPageTitle => 'Riwayat';

  @override
  String get settingsPageTitle => 'Pengaturan';

  @override
  String get sideA => 'Sisi A (berhadapan 30°)';

  @override
  String get sideB => 'Sisi B (berhadapan 60°)';

  @override
  String get sideC => 'Sisi C (Hipotenusa)';

  @override
  String inputSideHint(String sideName) {
    return 'Masukkan sisi $sideName';
  }

  @override
  String get calculateButton => 'Hitung';

  @override
  String get resetButton => 'Setel Ulang';

  @override
  String get areaLabel => 'Luas';

  @override
  String get perimeterLabel => 'Keliling';

  @override
  String get historySectionTitle => 'Riwayat Perhitungan';

  @override
  String get clearHistoryButton => 'Hapus Riwayat';

  @override
  String get inputLabel => 'Masukan';

  @override
  String get resultLabel => 'Hasil';

  @override
  String get timeLabel => 'Waktu';

  @override
  String get valueMustBePositive => 'Nilai harus lebih besar dari 0';

  @override
  String get invalidNumberFormat => 'Format angka tidak valid';

  @override
  String get pleaseEnterValue => 'Silakan masukkan nilai';

  @override
  String errorDuringCalculation(Object error) {
    return 'Kesalahan selama perhitungan: $error';
  }

  @override
  String get confirmClearHistoryTitle => 'Konfirmasi';

  @override
  String get confirmClearHistoryContent =>
      'Apakah Anda yakin ingin menghapus riwayat perhitungan?';

  @override
  String get cancelButton => 'Batal';

  @override
  String get clearButton => 'Hapus';

  @override
  String get historyCleared => 'Riwayat telah dihapus';

  @override
  String get fixInputErrors => 'Silakan perbaiki kesalahan di kolom input.';

  @override
  String get enterPositiveNumberForSide =>
      'Silakan masukkan angka positif yang benar untuk salah satu sisi.';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get appearanceSectionTitle => 'Tampilan';

  @override
  String get themeSettingTitle => 'Tema';

  @override
  String get lightTheme => 'Terang';

  @override
  String get darkTheme => 'Gelap';

  @override
  String get systemTheme => 'Sistem';

  @override
  String get languageSettingTitle => 'Bahasa';

  @override
  String get englishLanguage => 'Inggris';

  @override
  String get russianLanguage => 'Rusia';

  @override
  String get germanLanguage => 'Jerman';

  @override
  String get spanishLanguage => 'Spanyol';

  @override
  String get frenchLanguage => 'Perancis';

  @override
  String get indianLanguage => 'India';

  @override
  String get indonesianLanguage => 'Indonesia';

  @override
  String get japaneseLanguage => 'Jepang';

  @override
  String get koreanLanguage => 'Korea';

  @override
  String get portugueseLanguage => 'Portugis';

  @override
  String get systemLanguage => 'Default Sistem';

  @override
  String get aboutSectionTitle => 'Tentang';

  @override
  String get aboutApp => 'Tentang Aplikasi';

  @override
  String get feedback => 'Umpan Balik';

  @override
  String get shareApp => 'Bagikan Aplikasi';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get version => 'Versi';

  @override
  String get shareCalculation => 'Bagikan Perhitungan';

  @override
  String calculationDetails(Object inputSideName, Object inputValue,
      Object sideA, Object sideB, Object sideC, Object area, Object perimeter) {
    return 'Detail Perhitungan:\nMasukan: $inputSideName = $inputValue\nA: $sideA, B: $sideB, C: $sideC\nLuas: $area, Keliling: $perimeter';
  }

  @override
  String get pageUnderDevelopment => 'Halaman dalam pengembangan';

  @override
  String couldNotLaunchUrl(Object url) {
    return 'Tidak dapat membuka URL: $url';
  }

  @override
  String get appDescription => 'Kalkulator sederhana untuk segitiga 30-60-90.';

  @override
  String get appDescriptionMoreDetails =>
      'Aplikasi ini membantu Anda menghitung semua sisi, luas, dan keliling segitiga siku-siku 30-60-90 berdasarkan satu sisi yang diketahui dengan cepat. Aplikasi ini juga menyimpan riwayat perhitungan Anda untuk referensi mudah. Dikembangkan dengan Flutter.';

  @override
  String get versionInfoIconLabel => 'Informasi Versi';

  @override
  String get emptyHistoryPlaceholder => 'Riwayat kosong.';

  @override
  String get swipeDownToRefreshHint =>
      'Geser ke bawah untuk menyegarkan atau memuat riwayat.';
}
