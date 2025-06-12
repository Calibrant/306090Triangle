import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:triangle_306090/model/calc_widget_model.dart';
import 'package:triangle_306090/model/calc_widget_provider.dart';
import 'core/key.dart';
import 'dialog/dialog_helper.dart';
import 'generated/l10n.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  await Hive.openBox(IKey.numberKey);
  // Hive.deleteBoxFromDisk(IKey.numberKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = CalcWidgetModel();
    return CalcWidgetProvider(
      model: model,
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routes: {
          '/triangle': (context) => const Triangle(),
          '/assistance': (context) => const DialogHelper(),
        },
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (BuildContext context) => S.of(context).app_bar_title,
        theme: ThemeData(
          fontFamily: 'RobotoCondensed-Regular',
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const Triangle(),
      ),
    );
  }
}
