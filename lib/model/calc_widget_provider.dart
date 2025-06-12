import 'package:flutter/material.dart';
import 'calc_widget_model.dart';

class CalcWidgetProvider extends InheritedWidget {
  const CalcWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  final CalcWidgetModel model;

  static CalcWidgetProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalcWidgetProvider>();
  }

  @override
  bool updateShouldNotify(CalcWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }
}
