import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';

class GridViewPage extends ConsumerWidget {
  const GridViewPage({super.key, required this.entity, required this.text});
  static const routePath = '/topRatedPage';
  final String text;
  final List<MovieEntity> entity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: AppTheme.of(context).colors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: entity.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 170,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.push(OverviewPage.routePath, extra: entity[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiUrls.linksimage + entity[index].poster_path),
                        fit: BoxFit.cover)),
              ),
            );
          },
        ),
      ),
    );
  }
}
