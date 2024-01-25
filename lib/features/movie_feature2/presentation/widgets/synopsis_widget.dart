import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/cliprrect_widget.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/elevatedbutton_widget.dart';

class SynopsisWidget extends StatelessWidget {
  final String releaseyear;
  final String overview;
  final String rating;
  final String language;

  const SynopsisWidget(
      {super.key,
      required this.rating,
      required this.overview,
      required this.releaseyear,
      required this.language});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.25,
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 7.4,
            child: SingleChildScrollView(
              child: Text(overview,
                  style: TextStyle(
                      fontSize: theme.spaces.space_250,
                      color: theme.colors.textInverse,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CliprrectWidget(
                  height: theme.spaces.space_500,
                  text: HomePageConstants().year + releaseyear,
                  width: theme.spaces.space_250 * 9,
                  color:
                      AppTheme.of(context).colors.textSubtle.withOpacity(.60)),
              CliprrectWidget(
                  height: theme.spaces.space_500,
                  text: language,
                  width: theme.spaces.space_500 * 2,
                  color:
                      AppTheme.of(context).colors.textSubtle.withOpacity(.60)),
              CliprrectWidget(
                  height: theme.spaces.space_500,
                  text: '⭐$rating',
                  width: theme.spaces.space_500 * 2,
                  color:
                      AppTheme.of(context).colors.textSubtle.withOpacity(.60)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayButtonWidget(
                btntxt: HomePageConstants().playtxt,
                onPressed: () {},
              ),
              FloatingActionButton.small(
                backgroundColor: theme.colors.textSubtle.withOpacity(.50),
                onPressed: () {},
                child: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
