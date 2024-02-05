import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/homepage.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/profile_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/search_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/watchlist_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/bottomnavigation_widget.dart';

class PageViewWidget extends ConsumerWidget {
  const PageViewWidget({super.key});
  static const routePath = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
          controller: ref.watch(movieHomeProvider.notifier).pageController,
          onPageChanged: (value) {
            ref.read(pageProvider.notifier).state = value;
          },
          children: const [
            HomePage(),
            SearchPage(),
            WatchListPage(),
            ProfilePage(),
          ]),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
