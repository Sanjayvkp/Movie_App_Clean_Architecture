import 'package:flutter/material.dart';

class LoginContainerWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const LoginContainerWidget(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
