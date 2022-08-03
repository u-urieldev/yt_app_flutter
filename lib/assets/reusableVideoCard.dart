import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ReusableVideoCard extends StatelessWidget {
  String video_id;
  ReusableVideoCard({Key? key, required this.video_id})
      : super(key: key);

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

        return GestureDetector(
          onTap: () => print('Picado pa'),
          child: Container(
            height: 220,
            width: double.infinity,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Card(
              elevation: 5,
              //semanticContainer and clipBehavior allow the circle border in the image.
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    //This link contains the thumbnail of the video. 
                    child: Image.network(
                      'https://img.youtube.com/vi/$video_id/0.jpg', 
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 8, 12, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                          ),
                          flex: 6,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => print('Options'),
                            child: const Icon(Icons.more_horiz),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
