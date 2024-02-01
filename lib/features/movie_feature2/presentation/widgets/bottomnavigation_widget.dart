import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/theme/color_palatte.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';

class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(pageProvider),
      onTap: (value) {
        ref.read(movieHomeProvider.notifier).pageController.jumpToPage(value);
      },
      elevation: 0,
      backgroundColor: AppColorPalette.white.withOpacity(.50),
      selectedItemColor: AppTheme.of(context).colors.secondary,
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
