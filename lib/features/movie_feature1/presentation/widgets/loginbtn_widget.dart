import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class LoginButtonWidget extends ConsumerWidget {
  final String btntxt;
  const LoginButtonWidget({super.key, required this.btntxt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                MediaQuery.sizeOf(context).height / 13),
            backgroundColor: AppTheme.of(context).colors.secondary),
        onPressed: () {},
        child: Text(
          btntxt,
          style: TextStyle(
              color: AppTheme.of(context).colors.primary, fontSize: 20),
        ));
  }
}
