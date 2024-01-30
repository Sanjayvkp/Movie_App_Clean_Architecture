import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  final void Function()? onPressed;
  final IconData leadingicon;
  final IconData trailingicon;
  final String title;
  const AppBarWidget(
      {super.key,
      required this.onPressed,
      required this.leadingicon,
      required this.title,
      required this.trailingicon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Icon(
      //   leadingicon,
      //   color: AppTheme.of(context).colors.primary,
      // ),
      title: Text(
        title,
        style: AppTheme.of(context)
            .typography
            .h600
            .copyWith(color: AppTheme.of(context).colors.secondary),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            trailingicon,
            color: AppTheme.of(context).colors.secondary,
          )),
    );
  }
}
