import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triangle_306090/widgets/text_widget.dart';

class TextFieldLayout extends StatelessWidget {
  const TextFieldLayout({
    super.key,
    required this.controller,
    this.onChanged,
    this.enabled,
    required this.text,
    required this.hintText,
  });
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String text;
  final String hintText;

  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(text: text),
          SizedBox(
            width: 230,
            // height: 40,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
                FilteringTextInputFormatter.deny(RegExp('[ ,-]')),
              ],
              maxLength: 10,
              enabled: enabled,
              cursorColor: Colors.black,
              //cursorHeight: 24,
              showCursor: true,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 24,
                color: Color(0xff252127),
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 18,
                ),
                counterText: "",
                contentPadding: const EdgeInsets.all(5),
                filled: true,
                fillColor: const Color(0xffF8EDE3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Color(0xffF8EDE3)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
