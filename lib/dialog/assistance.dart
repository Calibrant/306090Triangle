import 'package:flutter/material.dart';
import 'package:triangle_306090/dialog/bit_depth/bit_depth.dart';
import 'package:triangle_306090/dialog/custom_dialog.dart';
import 'package:triangle_306090/widgets/custom_drawer.dart';
import '../generated/l10n.dart';

//! Decimal places zero one two ...
class Precision extends ICustomDialog {
  @override
  String getTitle() {
    return S.current.decimal_places;
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffD0B8A8),
      body: AlertDialog(
        elevation: 5,
        backgroundColor:const Color(0xFFF8EDE3),
        title: Text(getTitle(), style: const TextStyle(fontSize: 20)),
        content:
            const SizedBox(height: 300, width: 250, child: DecimalPlaces()),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('OK', style: TextStyle(fontSize: 18)),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/triangle', (_) => false);
            },
          ),
        ],
      ),
    );
  }
}

//!    ABOUT APP popup
class Assistance extends ICustomDialog {
  @override
  String getTitle() => S.current.help;

  @override
  Widget create(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xffD0B8A8),
    body: AlertDialog(
          elevation: 5,
          backgroundColor: const Color(0xffF8EDE3),
          content: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.help,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          getTitle(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    S.of(context).help_desc,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            ),
          ),
          /* */
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: context.theme.textTheme.labelLarge,
              ),
              child: const Text('OK', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/triangle', (_) => false);
              },
            ),
          ],
        ),
  );
}
