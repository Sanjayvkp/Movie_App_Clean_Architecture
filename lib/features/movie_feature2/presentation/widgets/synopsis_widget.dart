import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/youtube_trailer_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/cliprrect_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/elevatedbutton_widget.dart';

class SynopsisWidget extends ConsumerWidget {
  final String releaseyear;
  final String overview;
  final String rating;
  final String language;
  final void Function()? onPressed;
  final MovieEntity movie;

  const SynopsisWidget({
    super.key,
    required this.rating,
    required this.overview,
    required this.releaseyear,
    required this.language,
    required this.onPressed,
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppTheme.of(context).spaces.space_200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: AppTheme.of(context).spaces.space_200),
          Text(
            overview,
            style: TextStyle(
              fontSize: theme.spaces.space_200,
              color: theme.colors.secondary.withOpacity(.60),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: AppTheme.of(context).spaces.space_200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CliprrectWidget(
                  ratingtext: theme.colors.secondary,
                  height: theme.spaces.space_500,
                  text: HomePageConstants().year + releaseyear,
                  width: theme.spaces.space_250 * 9,
                  color:
                      AppTheme.of(context).colors.secondary.withOpacity(.20)),
              CliprrectWidget(
                  ratingtext: theme.colors.secondary,
                  height: theme.spaces.space_500,
                  text: language,
                  width: theme.spaces.space_500 * 2,
                  color:
                      AppTheme.of(context).colors.secondary.withOpacity(.20)),
              CliprrectWidget(
                  ratingtext: theme.colors.secondary,
                  height: theme.spaces.space_500,
                  text: '⭐$rating',
                  width: theme.spaces.space_500 * 2,
                  color:
                      AppTheme.of(context).colors.secondary.withOpacity(.20)),
            ],
          ),
          SizedBox(
            height: theme.spaces.space_300,
          ),
          PlayButtonWidget(
              btntxt: 'Watch Trailer',
              onPressed: () =>
                  context.push(YoutubePlayerPage.routePath, extra: movie),
              bgcolor: theme.colors.backgroundDanger,
              textcolor: theme.colors.primary),
          SizedBox(
            height: theme.spaces.space_250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Comments',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: const Text(
                    'Post a comment',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
