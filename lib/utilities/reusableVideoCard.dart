import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_app/screens/player.dart';

const TEXT_CARD_STYLE = TextStyle(color: Colors.white, fontSize: 15.0);

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

        // All the card is wraped whit a GestureDetector
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerScreen(
                video: snapshot.data,
              ),
            ),
          ),
          //This container sets the final size of the Card
          child: Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
            // The card will give elevation and circle border
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
              // The stack is used to put the gradient, title and the icon in front of the image
              child: Stack(
                children: [
                  // Thumbnail of the video
                  Image.network(
                    'https://img.youtube.com/vi/$video_id/0.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  // This container will give the gradient efect
                  Container(
                    width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [Colors.black, Colors.transparent]),
                    ),
                    // The row is the text and the icon
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(11, 0, 4, 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TEXT_CARD_STYLE,
                            ),
                            flex: 5,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => print('Options'),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
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
