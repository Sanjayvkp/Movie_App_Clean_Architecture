import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppTheme.of(context).colors.secondary,
      selectedItemColor: AppTheme.of(context).colors.primary,
      unselectedItemColor: AppTheme.of(context).colors.textSubtle,
      iconSize: AppTheme.of(context).spaces.space_300,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: ''),
      ],
    );
  }
}
