import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/profile_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/watchlist_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/listtile_widget.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
              child: Lottie.network(
                  // repeat: false,
                  // reverse: false,
                  'https://lottie.host/7aade954-83e2-4301-905f-52c9e3c9e25c/wV1h09kbpz.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover)),
          Text(
            HomePageConstants().appTitle,
            style: AppTheme.of(context).typography.h800,
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              MylistTile(
                title: HomePageConstants().drawerprofile,
                icon: Icons.person_2_outlined,
                onTap: () {
                  context.push(ProfilePage.routePath);
                },
              ),
              MylistTile(
                title: HomePageConstants().drawerwatchlist,
                icon: Icons.watch_later_outlined,
                onTap: () {
                  context.push(WatchListPage.routePath);
                },
              ),
              MylistTile(
                title: HomePageConstants().drawerlogout,
                icon: Icons.login_sharp,
                onTap: () {
                  ref.read(movieProvider.notifier).signOut(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
