import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 80,
      color: AppTheme.of(context).colors.secondary.withOpacity(.50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTheme.of(context)
                .typography
                .h700
                .copyWith(color: AppTheme.of(context).colors.primary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
