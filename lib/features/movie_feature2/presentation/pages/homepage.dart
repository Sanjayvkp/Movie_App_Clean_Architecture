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
      backgroundColor: theme.colors.secondary,
      appBar: AppBar(
        backgroundColor: theme.colors.secondary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: theme.colors.textSubtle,
            child: const Icon(Icons.person_2_outlined),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              constants.user,
              style:
                  theme.typography.h600.copyWith(color: theme.colors.primary),
            ),
            Text(
              constants.info,
              style: theme.typography.h300
                  .copyWith(color: theme.colors.textSubtle),
            )
          ],
        ),
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
          return SingleChildScrollView(
            child: Column(
              children: [
                const TextFieldHomeWidget(
                    labeltext: 'Search movie..', icondata: Icon(Icons.search)),
                SizedBox(
                  height: theme.spaces.space_300,
                ),
                CaroselWidget(itemcount: data.length, list: data),
                SizedBox(
                  height: theme.spaces.space_300,
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
                  height: theme.spaces.space_100,
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
      bottomNavigationBar:
          const SizedBox(height: 70, child: BottomNavigationWidget()),
    );
  }
}
