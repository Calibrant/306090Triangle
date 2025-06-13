// lib/utils/ad_helper.dart
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  // Тестовые идентификаторы. ЗАМЕНИТЕ на реальные перед публикацией!
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2717584945928240/2512447221';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // Тестовый iOS Banner ID
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // Можно добавить ID для других типов рекламы (interstitial, rewarded) здесь же

  static BannerAd createBannerAd({required Function() onAdLoaded}) {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner, // Стандартный размер баннера 320x50
      // Вы также можете использовать AdSize.adaptiveBanner, он лучше подстраивается
      // size: AdSize.getAnchoredAdaptiveBannerAdSize(
      //   Orientation.portrait, // или Orientation.landscape
      //   MediaQuery.of(context).size.width.truncate(), // ширина экрана
      // ) ?? AdSize.banner, // Фоллбэк на обычный баннер
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded.');
          onAdLoaded(); // Колбэк для обновления UI, когда реклама загружена
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$ad failedToLoad: $error');
          ad.dispose(); // Важно освободить ресурсы
        },
        onAdOpened: (Ad ad) => print('$ad onAdOpened.'),
        onAdClosed: (Ad ad) => print('$ad onAdClosed.'),
        // onAdImpression: (Ad ad) => print('$ad onAdImpression.'), // Для аналитики
      ),
    );
  }
}
