import 'package:flutter/material.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatelessWidget {
  static const routePath = '/youtube';
  const YoutubePlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).colors.secondary,
        title: const Text('Trailer'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: 'otNh9bTjXWg',
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
