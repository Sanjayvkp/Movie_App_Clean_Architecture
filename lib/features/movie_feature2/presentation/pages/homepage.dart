import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/bottomnavigation_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/carosel_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/listview_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/textbutton_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routePath = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = HomePageConstants();
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: AppBar(
        backgroundColor: theme.colors.secondary,
        leading: const Icon(Icons.menu),
        title: Text(
          constants.appTitle,
          style: theme.typography.h700
              .copyWith(color: theme.colors.backgroundDanger),
        ),
        centerTitle: true,
        toolbarHeight: theme.spaces.space_400 * 3,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(movieProvider.notifier).signOut(context);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: ref.watch(movieHomeProvider).when(
        data: (data) {
          // if (data == null) {
          //   return const Center(
          //     child: Text('Something went wrong'),
          //   );
          // }
          return SingleChildScrollView(
            child: Column(
              children: [
                CaroselWidget(itemcount: data.length, list: data),
                SizedBox(
                  height: theme.spaces.space_500,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        constants.trending,
                        style: theme.typography.h500
                            .copyWith(color: theme.colors.primary),
                      ),
                      TextButtonWidget(
                        text: constants.seemore,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: theme.spaces.space_200,
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height / 7,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListviewWidget(
                      itemcount: data.length,
                      list: data,
                    )),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_200,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        constants.topRated,
                        style: theme.typography.h500
                            .copyWith(color: theme.colors.primary),
                      ),
                      TextButtonWidget(
                        text: constants.seemore,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height / 7,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListviewWidget(
                      itemcount: data.length,
                      list: data,
                    )),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(10.0),
        child: BottomNavigationWidget(),
      ),
    );
  }
}
