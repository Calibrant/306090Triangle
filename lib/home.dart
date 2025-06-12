import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:triangle_306090/screens/text_field.dart';
import 'package:triangle_306090/widgets/custom_drawer.dart';
import 'ads/ad_helper.dart';
import 'generated/l10n.dart';

class Triangle extends StatefulWidget {
  const Triangle({super.key});

  @override
  State<Triangle> createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;
 // String status = 'none';

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  @override
  void initState() {
    _createBottomBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    _bottomBannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff7D6E83),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: _isBottomBannerAdLoaded
              ? SizedBox(
                  height: _bottomBannerAd.size.height.toDouble(),
                  width: _bottomBannerAd.size.width.toDouble(),
                  child: AdWidget(ad: _bottomBannerAd),
                )
              : null,
          drawer: const CustomDrawer(),
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF8EDE3),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/assistance'),
                  icon: const Icon(Icons.more_vert)),
            ],
            backgroundColor: const Color(0xffD0B8A8),
            title: Text(
              S.of(context).app_bar_title,
              style: const TextStyle(
                color: Color(0xff0c0b0d),
                fontSize: 21,
              ),
            ),
            centerTitle: true,
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: const Color(0xffF8EDE3),
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(
                      'assets/images/main_pic7a.png',
                      scale: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: double.infinity,
                      height: 500,
                      decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 5)],
                          color: Color(0xffD0B8A8),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: const TextfieldWidget()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
