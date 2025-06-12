import 'package:flutter/material.dart';
import 'package:triangle_306090/widgets/custom_drawer.dart';

class ElevatedButtonLayout extends StatelessWidget {
  const ElevatedButtonLayout({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        elevation: 10,
        minimumSize: const Size(60, 40),
        backgroundColor: const Color(0xff7D6E83),
      ),
      child: Text(
        'C',
        style: context.theme.textTheme.headlineSmall!
            .copyWith(color: const Color(0xffF8EDE3)),
      ),
    );
  }
}
