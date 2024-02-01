import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class CliprrectWidget extends ConsumerWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  final Color ratingtext;
  const CliprrectWidget(
      {super.key,
      required this.height,
      required this.text,
      required this.width,
      required this.color,
      required this.ratingtext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: width,
        height: height,
        color: color,
        child: Center(
          child: Text(
            text,
            style: AppTheme.of(context)
                .typography
                .h400
                .copyWith(color: ratingtext),
          ),
        ),
      ),
    );
  }
}
