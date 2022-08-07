import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utilities/reusableVideoCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utilities/dialog_reusable.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

// 'A_g3lMcWVy0',
// 'L2cnLYuTuuQ'
// 'Go8nTmfrQd8'

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late final currentUser = _auth.currentUser;

  // Function return the documents in videos, to easly reading
  CollectionReference<Map<String, dynamic>> getVideosPath(instance) {
    return instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('videos');
  }

  void addVideo(firestore, idTxt) async{
    var yt = YoutubeExplode();
    Video video =
        await yt.videos.get('https://www.youtube.com/watch?v=$idTxt');

    getVideosPath(_firestore).add({'videoID': idTxt, 'videoName': video.title});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Videos'),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => showDialog(
            context: context,
            builder: (BuildContext context) {
              final videoIDController = TextEditingController();
              return DialogReusable(videoIDController: videoIDController, dbAction: addVideo,);
            }),
        child: const Icon(Icons.add),
      ),
      body: ListView(children: [
        StreamBuilder<QuerySnapshot>(
            stream: getVideosPath(_firestore).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final videoList = snapshot.data!.docs;
                final List<Widget> widgetsList = [];

                for (var video in videoList) {
                  final toAddWidget = ReusableVideoCard(
                      video_id: video['videoID'],
                      video_name: video['videoName'],
                      reference: video.reference);

                  widgetsList.add(toAddWidget);
                }
                return Column(children: widgetsList);
              } else {
                return const Center(
                  child: Text(
                    'No data',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }
            })
      ]),
    );
  }
}


