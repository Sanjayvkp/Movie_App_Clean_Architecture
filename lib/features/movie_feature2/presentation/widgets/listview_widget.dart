import 'dart:io';

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
  final int itemcount;
  // final double height;
  final double width;

  const ListviewWidget(
      {super.key,
      required this.value,
      required this.itemcount,
      // required this.height,
      required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      physics: const PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: itemcount,
      itemBuilder: (context, index) {
        final backDropPathFile = File(value[index].backdrop_path);
        late final ImageProvider image;
        if (backDropPathFile.existsSync()) {
          image = FileImage(backDropPathFile);
        } else {
          image = NetworkImage(
            images + value[index].backdrop_path,
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: InkWell(
            onTap: () =>
                context.push(OverviewPage.routePath, extra: value[index]),
            child: Stack(
              children: [
                Container(
                  // height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: image, fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 1.1,
                    height: MediaQuery.sizeOf(context).height / 17,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.80),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Center(
                        child: Text(
                      value[index].originalTitle,
                      style: theme.typography.h500
                          .copyWith(color: theme.colors.primary),
                    )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
