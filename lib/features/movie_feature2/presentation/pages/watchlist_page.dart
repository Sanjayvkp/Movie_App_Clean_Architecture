import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/vertical_listview.dart';

class WatchListPage extends ConsumerWidget {
  static const routePath = '/watchlist';

  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.of(context).colors.secondary),
        title: Text(
          HomePageConstants().watclist,
          style: TextStyle(color: AppTheme.of(context).colors.secondary),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: AppTheme.of(context).colors.primary,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: StreamBuilder(
          stream:
              ref.read(movieHomeProvider.notifier).getallMoviesFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return VerticalListViewWidget(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  itemcount: snapshot.data!.length,
                  value: snapshot.data!);
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error:${snapshot.error}'),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
