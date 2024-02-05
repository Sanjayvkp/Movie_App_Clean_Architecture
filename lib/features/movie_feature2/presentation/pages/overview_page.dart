import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/theme/color_palatte.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/container_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/review_listview_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/show_model_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/synopsis_widget.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({
    super.key,
    required this.entity,
  });
  static const routePath = '/overview';
  final MovieEntity entity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final data = ref.read(movieHomeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          entity.title,
          style: TextStyle(color: theme.colors.secondary),
        ),
        backgroundColor: theme.colors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colors.secondary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Center(
                  child: ContainerWidget(
                    image: ApiUrls.linksimage + entity.poster_path,
                    width: MediaQuery.sizeOf(context).width / 1.1,
                    height: MediaQuery.sizeOf(context).height / 2.01,
                  ),
                ),
                Positioned(
                    left: 30,
                    top: theme.spaces.space_200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: theme.spaces.space_900,
                        height: theme.spaces.space_400,
                        color: AppTheme.of(context)
                            .colors
                            .secondary
                            .withOpacity(.80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: AppColorPalette.yellow,
                            ),
                            Text(
                              entity.voteCount.toString(),
                              style: TextStyle(color: theme.colors.primary),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    right: 30,
                    top: 8,
                    child: FloatingActionButton.small(
                      backgroundColor: theme.colors.secondary,
                      elevation: 0,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        ref
                            .read(movieHomeProvider.notifier)
                            .addtoFireStore(entity);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content:
                                  Text(HomePageConstants().overviewsuccess),
                            );
                          },
                        );
                      },
                    ))
              ],
            ),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Synopsis:',
                    style: theme.typography.h500
                        .copyWith(color: theme.colors.secondary),
                  ),
                ],
              ),
            ),
            SynopsisWidget(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ShowModelWidget(
                          onPressed: () {
                            data.addReview(
                                ReviewEntity(
                                    movieId: entity.id.toString(),
                                    review: data.reviewController.text,
                                    id: entity.id.toString()),
                                entity.id.toString());
                            data.reviewController.clear();
                            context.pop();
                          },
                          title: "Post about ${entity.title}");
                    },
                  );
                },
                language: entity.originalLanguage,
                rating: entity.voteAverage.toStringAsFixed(1),
                overview: entity.overview,
                releaseyear: entity.releaseDate.year.toString()),
            SizedBox(
              height: 500,
              child: StreamBuilder(
                stream: ref
                    .watch(movieHomeProvider.notifier)
                    .getReview(entity.id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                        child: CommentListViewWidget(entity: snapshot.data!));
                  } else if (snapshot.data == null) {
                    return const Center(
                      child: Text(
                        'No comments',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
