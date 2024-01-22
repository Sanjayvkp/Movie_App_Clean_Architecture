import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/iconbutton_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key, required this.entity});
  static const routePath = '/overview';
  final MovieEntity entity;
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 1.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiUrls.linksimage + entity.poster_path),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: theme.spaces.space_400,
                  child: IconButtonWidget(
                    icon: Icons.arrow_back_ios_new,
                    onpressed: () {
                      context.pop();
                    },
                    color: theme.colors.primary,
                  ),
                )
              ],
            ),
            SizedBox(
              height: theme.spaces.space_300,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2.3,
              width: MediaQuery.sizeOf(context).width / 1.1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Text(
                            entity.title,
                            style: theme.typography.h700
                                .copyWith(color: theme.colors.primary),
                          ),
                        ),
                        Text(
                          '⭐${entity.voteAverage}',
                          style: theme.typography.h400
                              .copyWith(color: theme.colors.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: theme.spaces.space_300,
                    ),
                    Text(entity.overview,
                        style: TextStyle(
                            fontSize: theme.spaces.space_250,
                            color: theme.colors.textInverse,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
