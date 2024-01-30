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
import 'package:movie_application/features/movie_feature2/presentation/widgets/heading_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/toprated_listview_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/listview_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/textfield_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routePath = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = HomePageConstants();
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: theme.colors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.push(ProfilePage.routePath);
          },
          icon: Icon(
            Icons.person,
            color: theme.colors.secondary,
          ),
        ),
        title: Text(
          constants.appTitle,
          style: TextStyle(color: theme.colors.secondary),
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(movieProvider.notifier).signOut(context),
              icon: Icon(
                Icons.logout,
                color: theme.colors.secondary,
              ))
        ],
      ),
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
                      TextFieldHomeWidget(
                          labeltext: HomePageConstants().searchText,
                          icondata: const Icon(Icons.search)),
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
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height / 6,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListviewWidget(
                            value: data.getPopular,
                          )),
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
                  child: TextButton(
                      onPressed: () {
                        ref.invalidate(movieHomeProvider);
                      },
                      child: const Text('Retry')),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
      bottomNavigationBar:
          const SizedBox(height: 70, child: BottomNavigationWidget()),
    );
  }
}
