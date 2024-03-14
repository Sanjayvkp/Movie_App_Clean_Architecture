import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/color_palatte.dart';
import 'package:movie_application/core/theme/extensions/color_extension.dart';
import 'package:movie_application/core/theme/extensions/space_extension.dart';
import 'package:movie_application/core/theme/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_theme.g.dart';

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    AppColorExtension(
      primary: Colors.black,
      secondary: Color.fromARGB(255, 255, 255, 255),
      text: AppColorPalette.grey900,
      textInverse: const Color.fromARGB(255, 195, 195, 195),
      textSubtle: const Color.fromARGB(255, 0, 0, 0),
      textSubtlest: AppColorPalette.grey500,
      backgroundDanger: Colors.red,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return _darkTheme;
}
