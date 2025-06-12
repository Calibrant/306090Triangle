// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:triangle_306090/model/calc_widget_provider.dart';
import '../../core/key.dart';
import '../../generated/l10n.dart';
import '../../widgets/radio_btn_widget.dart';

class DecimalPlaces extends StatefulWidget {
  const DecimalPlaces({super.key});

  @override
  State<DecimalPlaces> createState() => _DecimalPlacesState();
}

class _DecimalPlacesState extends State<DecimalPlaces> {

  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.numberKey);
    CalcWidgetProvider.of(context)!.model.groupValue =
        box.get(IKey.number, defaultValue: 0);
    super.didChangeDependencies();
  }

  void checkRadio(int? value) async {
    if (mounted) {
      setState(() {
        CalcWidgetProvider.of(context)!.model.groupValue = value!;
      });
    }
    Box box = Hive.box(IKey.numberKey);
    box.put(IKey.number, CalcWidgetProvider.of(context)!.model.groupValue);
  }

  @override
  Widget build(BuildContext context) {
    var model = CalcWidgetProvider.of(context)!.model.groupValue;

    return  SafeArea(
          child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    S.of(context).zero,
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: RadioWidget(
                    groupValue: model,
                    value: 0,
                    onChanged: (value) => checkRadio(value),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).one,
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: RadioWidget(
                    groupValue: model,
                    value: 1,
                    onChanged: (value) => checkRadio(value),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).two,
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: RadioWidget(
                    groupValue: model,
                    value: 2,
                    onChanged: (value) => checkRadio(value),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).three,
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: RadioWidget(
                    groupValue: model,
                    value: 3,
                    onChanged: (value) => checkRadio(value),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).four,
                    style: const TextStyle(fontSize: 18),
                  ),
                  leading: RadioWidget(
                    groupValue: model,
                    value: 4,
                    onChanged: (value) => checkRadio(value),
                  ),
                ),
              ],
            ),
          ),
        
      )),
    );
  }
}
