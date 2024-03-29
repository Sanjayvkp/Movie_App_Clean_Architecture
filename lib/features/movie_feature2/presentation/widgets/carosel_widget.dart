import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';

class CaroselWidget extends ConsumerWidget {
  final images = ApiUrls.linksimage;
  final List<MovieEntity> list;
  final int itemcount;
  const CaroselWidget({super.key, required this.itemcount, required this.list});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
      itemCount: list.length,
      itemBuilder: (context, index, realIndex) {
        final posterPathFile = File(list[index].poster_path);

        late final ImageProvider image;
        if (posterPathFile.existsSync()) {
          image = FileImage(posterPathFile);
        } else {
          image = NetworkImage(
            images + list[index].poster_path,
          );
        }

        return InkWell(
          onTap: () => context.push(OverviewPage.routePath, extra: list[index]),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppTheme.of(context).colors.textSubtle,
                image: DecorationImage(image: image, fit: BoxFit.fill)),
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height / 3.3,
        viewportFraction: 0.5,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
