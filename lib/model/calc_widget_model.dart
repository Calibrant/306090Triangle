import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcWidgetModel extends ChangeNotifier with EquatableMixin {
  int _groupValue = 4;
  int get groupValue => _groupValue;
  set groupValue(int value) {
    _groupValue = value;
    notifyListeners();
  }

  @override
  List<Object?> get props => [groupValue];
}
