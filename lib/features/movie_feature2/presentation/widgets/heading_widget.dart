import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/textbutton_widget.dart';

class HeadingWidget extends ConsumerWidget {
  final void Function()? onPressed;
  final String text;
  const HeadingWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = HomePageConstants();
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: theme.typography.h600,
          ),
          TextButtonWidget(
            text: constants.seemore,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
