import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final int groupValue, value;
  final ValueSetter<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio(
        activeColor: const Color(0xff7D6E83),
        value: value,
        groupValue: groupValue,
        onChanged: (value) => onChanged(value as int));
  }
}