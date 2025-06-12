import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:triangle_306090/widgets/textfield_layout.dart';
import '../core/key.dart';
import '../generated/l10n.dart';
import '../model/calc_widget_provider.dart';
import '../widgets/button_widget.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  late List<TextEditingController> ctrl =
      List.filled(5, TextEditingController());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i <= 4; i++) {
      ctrl[i] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var i = 0; i <= 4; i++) {
      ctrl[i].dispose();
    }
    super.dispose();
  }

  void _calculateA(int fractionDigits) {
    if (ctrl[0].text.trim().isNotEmpty) {
      final a = double.parse(ctrl[0].text);
      ctrl[1].text = (a * sqrt(3)).toStringAsFixed(fractionDigits);
      ctrl[2].text = (2 * a).toStringAsFixed(fractionDigits);
      ctrl[3].text =
          ((pow(a, 2) * sqrt(3) / 2)).toStringAsFixed(fractionDigits);
      ctrl[4].text = (a + a * sqrt(3) + 2 * a).toStringAsFixed(fractionDigits);
    }
  }

  void _calculateB(int fractionDigits) {
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

  void _calculateC(int fractionDigits) {
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
    for (var i = 0; i <= 4; i++) {
      ctrl[i].clear();
    }
  }

  int? decimalPlacesValue;

  @override
  void didChangeDependencies() {
    CalcWidgetProvider.of(context)!.model.groupValue =
        Hive.box(IKey.numberKey).get(IKey.number, defaultValue: 0);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        TextFieldLayout(
          hintText: S.of(context).side_a,
          text: 'a=',
          enabled: true,
          controller: ctrl[0],
          onChanged: (value) {
            _calculateA(CalcWidgetProvider.of(context)!.model.groupValue);
          },
        ),
        TextFieldLayout(
          hintText: S.of(context).side_b,
          text: 'b=',
          enabled: true,
          controller: ctrl[1],
          onChanged: (value) {
            _calculateB(CalcWidgetProvider.of(context)!.model.groupValue);
          },
        ),
        TextFieldLayout(
          hintText: S.of(context).side_c,
          text: 'c=',
          enabled: true,
          controller: ctrl[2],
          onChanged: (value) {
            _calculateC(CalcWidgetProvider.of(context)!.model.groupValue);
          },
        ),
        TextFieldLayout(
          hintText: S.of(context).area_A,
          text: 'A=',
          enabled: false,
          controller: ctrl[3],
        ),
        TextFieldLayout(
          hintText: S.of(context).periment_P,
          text: 'P=',
          enabled: false,
          controller: ctrl[4],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButtonLayout(
          onPressed: onTap,
        )
      ],
    );
  }
}
