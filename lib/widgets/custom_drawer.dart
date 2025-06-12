import 'package:flutter/material.dart';
import '../core/appconst.dart';
import '../core/launch_url.dart';
import '../generated/l10n.dart';

extension BuildContextExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ThemeData get theme => Theme.of(this);
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF8EDE3),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffD0B8A8),
              ),
              child: Center(
                child: DrawerHeaderWidger(),
              )),
          ListTile(
            leading: const Icon(Icons.touch_app, color: Colors.blue),
            title: const RateAppWidget(), //thumb_up
            onTap: () {
              const googlePlay = LaunchUrl();
              googlePlay.openURL(AppConst.googlePlay);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.blue),
            title: const PrivacyPolicyWidget(),
            onTap: () {
              const prPolicy = LaunchUrl();
              prPolicy.openURL(AppConst.prPolicy);
            },
          ),
          const ListTile(
            leading: Icon(Icons.verified, color: Colors.blue),
            title: VersionWidget(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Other math and algebraic calculators:',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.link, color: Colors.red),
            title: const Text('square root of 2'),
            onTap: () {
              const squareRootCalc = LaunchUrl();
              squareRootCalc.openURL(AppConst.squareRootApp);
            },
          ),
          ListTile(
            leading: const Icon(Icons.link, color: Colors.blue),
            title: const Text('Area of a triangle calculator'),
            onTap: () {
              const areaTrnglCalc = LaunchUrl();
              areaTrnglCalc.openURL(AppConst.areaTriangleCalculatorApp);
            },
          ),
        ],
      ),
    );
  }
}

class VersionWidget extends StatelessWidget {
  const VersionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Version 1.1.0');
  }
}

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(S.of(context).privacy_policy);
  }
}

class RateAppWidget extends StatelessWidget {
  const RateAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(S.of(context).rate_app);
  }
}

class DrawerHeaderWidger extends StatelessWidget {
  const DrawerHeaderWidger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).drawer_header,
      style: context.theme.textTheme.titleLarge!,
    );
  }
}
