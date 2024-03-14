import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/gridview_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/profile_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/carosel_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/drawer_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/heading_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/toprated_listview_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/listview_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/textfield_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routePath = '/home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = HomePageConstants();
    return Scaffold(
      backgroundColor: theme.colors.primary,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: theme.colors.primary,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              )),
        ),
        title: Text(
          constants.appTitle,
          style: TextStyle(color: theme.colors.secondary),
        ),
      ),
      drawer: const DrawerWidget(),
      body: ref.watch(movieHomeProvider).isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ref.watch(movieHomeProvider).when(
              data: (data) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: theme.spaces.space_300,
                      ),
                      CaroselWidget(
                          itemcount: data.getMovies.length,
                          list: data.getMovies),
                      SizedBox(
                        height: theme.spaces.space_300,
                      ),
                      HeadingWidget(
                        text: constants.trending,
                        onPressed: () {
                          context.push(GridViewPage.routePath,
                              extra: (data.getPopular, constants.trending));
                        },
                      ),
                      SizedBox(
                        height: theme.spaces.space_100,
                      ),
                      Center(
                        child: SizedBox(
                            height: MediaQuery.sizeOf(context).height / 4,
                            width: MediaQuery.sizeOf(context).width,
                            child: ListviewWidget(
                              // height: MediaQuery.sizeOf(context).height / 4,
                              width: MediaQuery.sizeOf(context).width / 1.1,
                              value: data.getPopular,
                              itemcount: 10,
                            )),
                      ),
                      SizedBox(
                        height: AppTheme.of(context).spaces.space_200,
                      ),
                      HeadingWidget(
                        text: constants.topRated,
                        onPressed: () {
                          context.push(GridViewPage.routePath,
                              extra: (data.getTopRated, constants.topRated));
                        },
                      ),
                      SizedBox(
                        height: theme.spaces.space_100,
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height / 5,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListViewTopRatedWidget(
                            value: data.getTopRated,
                          )),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(error.toString()),
                      TextButton(
                          onPressed: () {
                            ref.invalidate(movieHomeProvider);
                          },
                          child: const Text('Retry')),
                    ],
                  ),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}
