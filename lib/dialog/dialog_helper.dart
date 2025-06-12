import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'assistance.dart';
import 'custom_dialog.dart';
import 'dialog_selection_widget.dart';

class DialogHelper extends StatefulWidget {
  const DialogHelper({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DialogHelperState createState() => _DialogHelperState();
}

class _DialogHelperState extends State<DialogHelper> {
  final List<ICustomDialog> customDialogList = [
    Assistance(),
    Precision(),
    // CheckOutApp(),
  ];

  int _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    final selectedDialog = customDialogList[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int? index) {
    setState(() {
      _selectedDialogIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8EDE3),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DialogSelection(
                  customDialogList: customDialogList,
                  selectedIndex: _selectedDialogIndex,
                  onChanged: _setSelectedDialogIndex,
                ),
                // ),
                const SizedBox(height: 16.0),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  elevation: 5,
                  minWidth: 100,
                  height: 50,
                  color: const Color(0xff7D6E83),
                  textColor: Colors.white,
                  onPressed: () => _showCustomDialog(context),
                  child: Text(
                    S.of(context).show_btn,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Disable',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
