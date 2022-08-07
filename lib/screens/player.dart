import 'package:flutter/material.dart';
import 'package:yt_app/utilities/yt_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

const kTextVideoPlayer = TextStyle(color: Colors.red);
const kMetadataVideo = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
const kCounterText = TextStyle(fontWeight: FontWeight.bold);

class PlayerScreen extends StatelessWidget {
  final video_id;

  const PlayerScreen({Key? key, required this.video_id}) : super(key: key);

  // Future<Video> _setMetadata() async {
  //   // The video object contains all in relation of a YouTube Video
  //   var yt = YoutubeExplode();
  //   Video video =
  //       await yt.videos.get('https://www.youtube.com/watch?v=$video_id');

  //   return video;
  // }

  //TODO: Future Builder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          video.title,
          style: const TextStyle(fontSize: 17.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            YouTubeWidget(
              video_id: video_id,
            ),
            MetadataSection(video: video),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Back',
                        style: kMetadataVideo,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MetadataSection extends StatelessWidget {
  const MetadataSection({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  Text videoText(text) {
    return Text(text + ': ', style: kTextVideoPlayer);
  }

  Text metadataText(text) {
    return Text(text + '\n', style: kMetadataVideo);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                videoText('Title'),
                metadataText(video.title),
                videoText('Author'),
                metadataText(video.author),
                videoText('Duration'),
                // Line to show in format hh:mm:ss
                metadataText(video.duration.toString().split('.').first.padLeft(8, "0")), 
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Icon(Icons.thumb_up, color: Colors.red),
                  Text(
                    video.engagement.likeCount.toString(),
                    style: kCounterText,
                  ),
                  const SizedBox(height: 20.0),
                  const Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  Text(
                    video.engagement.dislikeCount.toString(),
                    style: kCounterText,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
