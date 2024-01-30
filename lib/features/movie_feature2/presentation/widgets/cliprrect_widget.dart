import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class CliprrectWidget extends ConsumerWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  const CliprrectWidget(
      {super.key,
      required this.height,
      required this.text,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        color: color,
        child: Center(
          child: Text(
            text,
            style: AppTheme.of(context)
                .typography
                .h500
                .copyWith(color: AppTheme.of(context).colors.secondary),
          ),
        ),
      ),
    );
  }
}
