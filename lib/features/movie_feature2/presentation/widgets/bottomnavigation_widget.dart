import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/theme/color_palatte.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: AppColorPalette.black.withOpacity(.80),
      selectedItemColor: AppTheme.of(context).colors.primary,
      unselectedItemColor: AppTheme.of(context).colors.textSubtlest,
      iconSize: AppTheme.of(context).spaces.space_300,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: ''),
      ],
    );
  }
}
