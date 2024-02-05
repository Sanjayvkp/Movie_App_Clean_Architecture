import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/gridview_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/heading_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/search_textfield_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/toprated_listview_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_600,
            ),
            Center(
              child: SearchTextFieldWidget(
                  labeltext: HomePageConstants().searchText,
                  icondata: const Icon(Icons.search)),
            ),
            Builder(builder: (context) {
              return ref.watch(movieHomeProvider).when(
                data: (data) {
                  if (data.searchMovies == null) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'Top Suggestions',
                                style: AppTheme.of(context).typography.h600,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListViewTopRatedWidget(
                            value: data.getTopRated,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListViewTopRatedWidget(
                            value: data.getPopular,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListViewTopRatedWidget(
                            value: data.getMovies,
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                '${data.searchMovies!.length} results according to your search:',
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SizedBox(
                            height: 620,
                            child: GridView.builder(
                                itemCount: data.searchMovies!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      context.push(OverviewPage.routePath,
                                          extra: data.searchMovies![index]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  ApiUrls.linksimage +
                                                      data.searchMovies![index]
                                                          .poster_path),
                                              fit: BoxFit.fill)),
                                    ),
                                  );
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisExtent: 180,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10)),
                          ),
                        ),
                      ],
                    );
                  }
                },
                error: (error, stackTrace) {
                  return const Center(
                    child: Text('no results'),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
