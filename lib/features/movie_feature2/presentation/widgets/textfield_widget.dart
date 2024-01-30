import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/theme/color_palatte.dart';

class TextFieldHomeWidget extends ConsumerWidget {
  final String labeltext;
  final Icon icondata;

  const TextFieldHomeWidget({
    super.key,
    required this.labeltext,
    required this.icondata,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.12,
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: AppTheme.of(context).spaces.space_300,
                horizontal: AppTheme.of(context).spaces.space_400),
            hintText: labeltext,
            prefixIcon: icondata,
            prefixIconColor: AppColorPalette.black.withOpacity(.50),
            hintStyle: TextStyle(color: AppColorPalette.black.withOpacity(.50)),
            fillColor: AppTheme.of(context).colors.primary.withOpacity(.50),
            filled: true,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.of(context).colors.secondary),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
