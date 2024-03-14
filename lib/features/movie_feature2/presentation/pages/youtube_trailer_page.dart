import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/trailer_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends ConsumerWidget {
  static const routePath = '/youtube';
  final MovieEntity movie;
  const YoutubePlayerPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).colors.secondary,
        title: const Text('Trailer'),
      ),
      body: ref.watch(trailerProvider(movie!.id.toString())).isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .24,
                child: Center(
                  child: switch (
                      ref.watch(trailerProvider(movie!.id.toString()))) {
                    AsyncData(:final value) => PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          // return Center(
                          //   child: Text(value[index].name),
                          // );
                          return YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: value[index].key,
                              flags: const YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                                disableDragSeek: true,
                              ),
                            ),
                            bufferIndicator: const Center(
                                child: CircularProgressIndicator()),
                            showVideoProgressIndicator: true,
                          );
                        },
                      ),
                    AsyncError(:final error) => Column(
                        children: [
                          Text("$error"),
                          TextButton(
                            onPressed: () {
                              ref.invalidate(
                                  trailerProvider(movie!.id.toString()));
                            },
                            child: const Text('Retry'),
                          )
                        ],
                      ),
                    _ => const CircularProgressIndicator()
                  },
                ),
              ),
            ),
    );
  }
}
