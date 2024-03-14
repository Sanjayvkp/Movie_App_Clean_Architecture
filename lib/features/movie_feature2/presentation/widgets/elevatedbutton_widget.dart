import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayButtonWidget extends ConsumerWidget {
  final String btntxt;
  final void Function()? onPressed;
  final Color bgcolor;
  final Color textcolor;
  const PlayButtonWidget(
      {super.key,
      required this.btntxt,
      required this.onPressed,
      required this.bgcolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                MediaQuery.sizeOf(context).height / 16),
            backgroundColor: bgcolor),
        onPressed: onPressed,
        child: Text(
          btntxt,
          style: TextStyle(color: textcolor, fontSize: 20),
        ));
  }
}
