import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ReusableVideoCard extends StatelessWidget {
  String video_id;
  ReusableVideoCard({Key? key, required this.video_id}) : super(key: key);

  Future<Video> _setMetadata() async {
    // The video object contains all in relation of a YouTube Video
    var yt = YoutubeExplode();
    Video video =
        await yt.videos.get('https://www.youtube.com/watch?v=$video_id');

    return video;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _setMetadata(),
      builder: (context, AsyncSnapshot snapshot) {
        String title = "Loading...";

        if (snapshot.hasData) {
          title = snapshot.data!.title.toString();
        }

        return Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.all(9.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.0), color: Colors.red),
          child: Stack(children: [
            Image.network(
              'https://img.youtube.com/vi/$video_id/0.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black, Colors.transparent]),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}

