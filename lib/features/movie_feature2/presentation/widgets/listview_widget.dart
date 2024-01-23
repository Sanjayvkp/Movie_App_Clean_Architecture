import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';

class ListviewWidget extends ConsumerWidget {
  final images = ApiUrls.linksimage;
  final List<MovieEntity> list;
  final int itemcount;
  const ListviewWidget(
      {super.key, required this.list, required this.itemcount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemcount,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: AppTheme.of(context).spaces.space_200,
            ),
            InkWell(
              onTap: () =>
                  context.push(OverviewPage.routePath, extra: list[index]),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 5,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.of(context).colors.textSubtle,
                    image: DecorationImage(
                        image: NetworkImage(
                          images + list[index].backdrop_path,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        );
      },
    );
  }
}
