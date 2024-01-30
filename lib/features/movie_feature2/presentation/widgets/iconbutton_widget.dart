import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final void Function()? onpressed;
  final IconData icon;
  final Color color;
  final double size;
  const IconButtonWidget(
      {super.key,
      required this.icon,
      required this.onpressed,
      required this.color,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
