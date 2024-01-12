import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class TextfieldWidget extends StatelessWidget {
  final String labeltext;
  final Icon icondata;
  const TextfieldWidget(
      {super.key, required this.labeltext, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextField(
        autofocus: false,
        cursorColor: AppTheme.of(context).colors.secondary,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: AppTheme.of(context).spaces.space_300,
                horizontal: AppTheme.of(context).spaces.space_400),
            hintText: labeltext,
            prefixIcon: icondata,
            labelStyle: TextStyle(color: AppTheme.of(context).colors.secondary),
            fillColor: AppTheme.of(context).colors.textInverse,
            filled: true,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.of(context).colors.primary),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
