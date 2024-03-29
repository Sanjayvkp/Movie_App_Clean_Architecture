import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContainerWidget extends ConsumerWidget {
  final ImageProvider image;
  final double width;
  final double height;
  const ContainerWidget(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: image, fit: BoxFit.fill),
      ),
    );
  }
}
