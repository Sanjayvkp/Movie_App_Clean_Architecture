import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class PlayButtonWidget extends ConsumerWidget {
  final String btntxt;
  final void Function()? onPressed;
  const PlayButtonWidget(
      {super.key, required this.btntxt, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.30,
                MediaQuery.sizeOf(context).height / 16),
            backgroundColor: AppTheme.of(context).colors.backgroundDanger),
        onPressed: onPressed,
        child: Text(
          btntxt,
          style: TextStyle(
              color: AppTheme.of(context).colors.secondary, fontSize: 20),
        ));
  }
}
