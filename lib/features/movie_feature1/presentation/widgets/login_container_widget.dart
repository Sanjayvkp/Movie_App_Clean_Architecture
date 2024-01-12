import 'package:flutter/material.dart';

class LoginContainerWidget extends StatelessWidget {
  final String image;
  final double height;
  const LoginContainerWidget(
      {super.key, required this.image, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 80,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
