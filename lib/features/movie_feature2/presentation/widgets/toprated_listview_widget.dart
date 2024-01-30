import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';

class ListViewTopRatedWidget extends ConsumerWidget {
  const ListViewTopRatedWidget({super.key, required this.value});
  final List<MovieEntity> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: AppTheme.of(context).spaces.space_250,
            ),
            InkWell(
              onTap: () {
                context.push(OverviewPage.routePath, extra: value[index]);
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiUrls.linksimage + value[index].poster_path),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        );
      },
    );
  }
}
