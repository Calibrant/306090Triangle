import 'package:flutter/material.dart';

abstract class ICustomDialog {
  String getTitle();
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) {
    var dialog = create(context);

    return showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
