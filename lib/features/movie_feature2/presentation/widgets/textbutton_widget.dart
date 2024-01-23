import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/color_palatte.dart';

class TextButtonWidget extends ConsumerWidget {
  final void Function()? onPressed;
  final String text;
  const TextButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColorPalette.grey500),
      ),
    );
  }
}
