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

        return GestureDetector(
          onTap: () => print('picado pa'),
          child: Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(9.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0)),
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 0, 4, 6),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white, fontSize: 15.0),
                            ),
                            flex: 6,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => print('Options'),
                              child: const Icon(Icons.more_horiz, color: Colors.white, size: 27,),
                            ),
                            flex: 1,
                          ),
                        ]),
                  ))
            ]),
          ),
        );
      },
    );
  }
}

