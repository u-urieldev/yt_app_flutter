import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YouTubeWidget extends StatelessWidget {
  final String video_id;
  late YoutubePlayerController _controller;
  
  void _setController(){
    _controller = YoutubePlayerController(
            initialVideoId: video_id,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: true,
              isLive: false,
            ),
    );
  }
  
  YouTubeWidget({required String this.video_id});

  @override
  Widget build(BuildContext context) {
    _setController();
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
      ),
    );
  }
}

