import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/theme/color_palatte.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/cliprrect_widget.dart';

class VerticalListViewWidget extends ConsumerWidget {
  final images = ApiUrls.linksimage;
  final List<MovieEntity> value;
  final int itemcount;
  final double height;
  final double width;

  const VerticalListViewWidget({
    super.key,
    required this.value,
    required this.itemcount,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: itemcount,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_200,
            ),
            InkWell(
              onTap: () =>
                  context.push(OverviewPage.routePath, extra: value[index]),
              child: Stack(
                children: [
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              color: Color.fromARGB(255, 78, 78, 78))
                        ],
                        color: AppColorPalette.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 251, 251))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        images + value[index].poster_path),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: SizedBox(
                                  width: 180,
                                  child: Text(
                                    value[index].title,
                                    style: theme.typography.h600.copyWith(
                                        color: theme.colors.secondary),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 130,
                    child: CliprrectWidget(
                        height: 20,
                        text: value[index].releaseDate.year.toString(),
                        width: 50,
                        color: theme.colors.textSubtlest,
                        ratingtext: theme.colors.primary),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: CliprrectWidget(
                        ratingtext: theme.colors.primary,
                        height: 20,
                        text: '⭐${value[index].voteAverage.toStringAsFixed(1)}',
                        width: 55,
                        color: Colors.black.withOpacity(.6)),
                  ),
                  Positioned(
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                    const Text('Are you sure want to remove?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        ref
                                            .read(movieHomeProvider.notifier)
                                            .deleteFromFireBase(
                                                value[index].id.toString());
                                        context.pop();
                                      },
                                      child: const Text('Yes')),
                                  TextButton(
                                      onPressed: () => context.pop(),
                                      child: const Text('No'))
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          size: 30,
                        ),
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
