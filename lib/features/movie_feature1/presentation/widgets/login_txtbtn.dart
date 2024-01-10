import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class LogintxtButtonWidget extends ConsumerWidget {
  final String txtbtntext;
  const LogintxtButtonWidget({super.key, required this.txtbtntext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {},
      child: Text(
        txtbtntext,
        style: TextStyle(color: AppTheme.of(context).colors.textSubtle),
      ),
    );
  }
}
