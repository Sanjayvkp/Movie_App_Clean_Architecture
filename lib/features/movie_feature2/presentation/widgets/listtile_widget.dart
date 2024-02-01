import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class MylistTile extends ConsumerWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const MylistTile(
      {required this.title,
      required this.icon,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListTile(
      iconColor: theme.colors.secondary,
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: theme.typography.h600.copyWith(color: theme.colors.secondary),
      ),
      onTap: onTap,
    );
  }
}
