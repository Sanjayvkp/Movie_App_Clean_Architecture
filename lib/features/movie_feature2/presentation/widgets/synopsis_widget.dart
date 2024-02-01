import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/youtube_trailer_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/cliprrect_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/elevatedbutton_widget.dart';

class SynopsisWidget extends ConsumerWidget {
  final String releaseyear;
  final String overview;
  final String rating;
  final String language;
  final void Function()? onPressed;

  const SynopsisWidget({
    super.key,
    required this.rating,
    required this.overview,
    required this.releaseyear,
    required this.language,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.45,
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 9,
            width: MediaQuery.sizeOf(context).width / 1.1,
            child: SingleChildScrollView(
              child: Text(
                overview,
                style: TextStyle(
                    fontSize: theme.spaces.space_200,
                    color: theme.colors.secondary.withOpacity(.60),
                    fontWeight: FontWeight.w500),
                // textAlign: TextAlign.justify,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CliprrectWidget(
                  ratingtext: theme.colors.secondary,
                  height: theme.spaces.space_500,
                  text: HomePageConstants().year + releaseyear,
                  width: theme.spaces.space_250 * 9,
                  color: AppTheme.of(context)
                      .colors
                      .textSubtlest
                      .withOpacity(.30)),
              CliprrectWidget(
                  ratingtext: theme.colors.secondary,
                  height: theme.spaces.space_500,
                  text: language,
                  width: theme.spaces.space_500 * 2,
                  color: AppTheme.of(context)
                      .colors
                      .textSubtlest
                      .withOpacity(.30)),
              CliprrectWidget(
                  ratingtext: theme.colors.secondary,
                  height: theme.spaces.space_500,
                  text: '⭐$rating',
                  width: theme.spaces.space_500 * 2,
                  color: AppTheme.of(context)
                      .colors
                      .textSubtlest
                      .withOpacity(.30)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayButtonWidget(
                btntxt: HomePageConstants().playtxt,
                bgcolor: theme.colors.backgroundDanger,
                textcolor: theme.colors.secondary,
                onPressed: () {
                  context.push(YoutubePlayerPage.routePath);
                },
              ),
              FloatingActionButton.small(
                  backgroundColor: theme.colors.textSubtlest,
                  elevation: 0,
                  onPressed: onPressed,
                  child: const Icon(
                    Icons.note_alt_outlined,
                    size: 25,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
