import 'package:flutter/material.dart';

class LoginContainerWidget extends StatelessWidget {
  final String image;
  const LoginContainerWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          // color: Colors.amber,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
