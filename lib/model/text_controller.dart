import 'dart:math';

import 'package:flutter/material.dart';

class TextController {
  late List<TextEditingController> ctrl =
      List.filled(5, TextEditingController());

  void calculateA(int fractionDigits) {
    if (ctrl[0].text.trim().isNotEmpty) {
      final a = double.parse(ctrl[0].text);
      ctrl[1].text = (a * sqrt(3)).toStringAsFixed(fractionDigits);
      ctrl[2].text = (2 * a).toStringAsFixed(fractionDigits);
      ctrl[3].text =
          ((pow(a, 2) * sqrt(3) / 2)).toStringAsFixed(fractionDigits);
      ctrl[4].text = (a + a * sqrt(3) + 2 * a).toStringAsFixed(fractionDigits);
    }
  }

  void calculateB(int fractionDigits) {
    if (ctrl[1].text.trim().isNotEmpty) {
      final b = double.parse(ctrl[1].text);
      ctrl[0].text = (b * sqrt(3) / 3).toStringAsFixed(fractionDigits);
      ctrl[2].text = (2 * b * sqrt(3) / 3).toStringAsFixed(fractionDigits);
      ctrl[3].text =
          ((pow(b, 2) * tan(0.523599)) / 2).toStringAsFixed(fractionDigits);
      ctrl[4].text = ((b * sqrt(3) / 3) + b + 2 * b * sqrt(3) / 3)
          .toStringAsFixed(fractionDigits);
    }
  }

  void calculateC(int fractionDigits) {
    if (ctrl[2].text.trim().isNotEmpty) {
      final c = double.parse(ctrl[2].text);
      ctrl[0].text = (c / 2).toStringAsFixed(fractionDigits);
      ctrl[1].text = (c * sqrt(3) / 2).toStringAsFixed(fractionDigits);
      ctrl[3].text =
          (pow(c, 2) * sin(2 * 0.523599) / 4).toStringAsFixed(fractionDigits);
      ctrl[4].text =
          (c + c / 2 + c * sqrt(3) / 2).toStringAsFixed(fractionDigits);
    }
  }

  void onTap() {
    ctrl[0].clear();
    ctrl[1].clear();
    ctrl[2].clear();
    ctrl[3].clear();
    ctrl[4].clear();
  }
}
