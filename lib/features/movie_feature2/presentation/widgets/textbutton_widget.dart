import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextButtonWidget extends ConsumerWidget {
  final void Function()? onPressed;
  final String text;
  const TextButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
