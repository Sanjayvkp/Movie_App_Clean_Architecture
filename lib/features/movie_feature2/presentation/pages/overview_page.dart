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
          entity.originalTitle,
          style: TextStyle(color: theme.colors.secondary),
        ),
        backgroundColor: theme.colors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colors.secondary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: ContainerWidget(
                    image: ApiUrls.linksimage + entity.poster_path,
                    width: MediaQuery.sizeOf(context).width / 1.3,
                    height: MediaQuery.sizeOf(context).height / 2.01,
                  ),
                ),
                Positioned(
                    left: 60,
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
                    right: 60,
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
            SynopsisWidget(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ShowModelWidget(
                          onPressed: () {
                            data.addReview(ReviewEntity(
                                review: data.reviewController.text));
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
                releaseyear: entity.releaseDate.year.toString())
          ],
        ),
      ),
    );
  }
}
