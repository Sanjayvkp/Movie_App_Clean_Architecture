import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class IconButtonWidget extends StatelessWidget {
  final void Function()? onpressed;
  final IconData icon;
  final Color color;
  const IconButtonWidget(
      {super.key,
      required this.icon,
      required this.onpressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: Icon(
        icon,
        size: 20,
        color: color,
      ),
    );
  }
}
