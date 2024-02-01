import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/theme/app_theme.dart';
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
                      width: MediaQuery.sizeOf(context).width / 1.1,
                      height: MediaQuery.sizeOf(context).height / 18,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.70),
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
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
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
                                      child: Text('Yes')),
                                  TextButton(
                                      onPressed: () => context.pop(),
                                      child: Text('No'))
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
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
