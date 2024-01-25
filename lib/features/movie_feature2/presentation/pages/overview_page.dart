import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/theme/color_palatte.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/container_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/iconbutton_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/synopsis_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/title_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key, required this.entity});
  static const routePath = '/overview';
  final MovieEntity entity;
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      body: Column(
        children: [
          Stack(
            children: [
              ContainerWidget(
                image: ApiUrls.linksimage + entity.poster_path,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 1.8,
              ),
              Positioned(
                top: theme.spaces.space_400,
                left: 10,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: theme.colors.secondary.withOpacity(.80),
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButtonWidget(
                    size: 20,
                    icon: Icons.arrow_back_ios_new,
                    onpressed: () {
                      context.pop();
                    },
                    color: theme.colors.primary,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: TitleWidget(
                  title: entity.title,
                ),
              ),
              Positioned(
                  right: 10,
                  top: theme.spaces.space_400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: theme.spaces.space_900,
                      height: theme.spaces.space_400,
                      color: AppTheme.of(context)
                          .colors
                          .secondary
                          .withOpacity(.50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: AppColorPalette.yellow,
                          ),
                          Text(
                            entity.voteCount.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          SynopsisWidget(
              language: entity.originalLanguage,
              rating: entity.voteAverage.toStringAsFixed(1),
              overview: entity.overview,
              releaseyear: entity.releaseDate.year.toString())
        ],
      ),
    );
  }
}
