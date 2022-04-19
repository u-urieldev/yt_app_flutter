import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YouTubeWidget extends StatelessWidget {
  final String url;
  late YoutubePlayerController _controller;
  
  void _setController(){
    _controller = YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(url) ?? "",
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: true,
              isLive: false,
            ),
    );
  }

  
  YouTubeWidget({required String this.url});

  @override
  Widget build(BuildContext context) {
    _setController();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
    );
  }
}

