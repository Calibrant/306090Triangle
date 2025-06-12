import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2717584945928240/2512447221";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2717584945928240/2512447221";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }

}