import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_app/screens/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dialog_reusable.dart';

const TEXT_CARD_STYLE = TextStyle(color: Colors.white, fontSize: 15.0);

class ReusableVideoCard extends StatelessWidget {
  String video_id;
  String video_name;
  final DocumentReference<Object?> reference;

  ReusableVideoCard({Key? key, required this.video_id, required this.reference, required this.video_name})
      : super(key: key);

  // Future<Video> _setMetadata() async {
  //   // The video object contains all in relation of a YouTube Video
  //   var yt = YoutubeExplode();
  //   Video video =
  //       await yt.videos.get('https://www.youtube.com/watch?v=$video_id');

  //   return video;
  // }

  void editVideo(firestore, idTxt) async{
    var yt = YoutubeExplode();
    Video video =
        await yt.videos.get('https://www.youtube.com/watch?v=$idTxt');

    try {
      firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('videos')
          .doc(reference.id)
          .set({"videoID": idTxt, "videoName": video.title});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () =>
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerScreen(
                video_id: video_id, //snapshot.data
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
                    // The row is for the text and icons
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(11, 0, 4, 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              video_name,
                              overflow: TextOverflow.ellipsis,
                              style: TEXT_CARD_STYLE,
                            ),
                            flex: 7,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final videoIDController =
                                          TextEditingController();
                                      return DialogReusable(
                                        videoIDController: videoIDController,
                                        dbAction: editVideo,
                                      );
                                    });
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('videos')
                                      .doc(reference.id)
                                      .delete();
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 20,
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
  }
}
