import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({super.key, required this.value});
  final List<MovieEntity> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 170,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: value.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.push(OverviewPage.routePath, extra: value[index]);
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        ApiUrls.linksimage + value[index].poster_path),
                    fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}
