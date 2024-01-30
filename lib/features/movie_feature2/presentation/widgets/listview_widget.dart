import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';

class ListviewWidget extends ConsumerWidget {
  final images = ApiUrls.linksimage;
  final List<MovieEntity> value;
  const ListviewWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: AppTheme.of(context).spaces.space_200,
            ),
            InkWell(
              onTap: () =>
                  context.push(OverviewPage.routePath, extra: value[index]),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 5,
                    width: MediaQuery.sizeOf(context).width / 1.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              images + value[index].backdrop_path,
                            ),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 1.3,
                      height: MediaQuery.sizeOf(context).height / 19,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.70),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Center(
                          child: Text(
                        value[index].title,
                        style: theme.typography.h400
                            .copyWith(color: theme.colors.primary),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
