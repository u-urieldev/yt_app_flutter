import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utilities/reusableVideoCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser!.email.toString()),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => showDialog(
            context: context,
            builder: (BuildContext context) {
              final videoIDController = TextEditingController();
              return AlertDialog(
                insetPadding: const EdgeInsets.symmetric(vertical: 270),
                title: const Text('Enter an ID YouTube Video'),
                content:
                    Center(child: TextField(controller: videoIDController)),
                actions: [
                  TextButton(
                      onPressed: () {
                        getVideosPath(_firestore)
                            .add({'videoID': videoIDController.text});
                        Navigator.pop(context, 'CANCEL');
                      },
                      child: const Text('OK')),
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'CANCEL'),
                      child: const Text('Cancel')),
                ],
              );
            }),
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        StreamBuilder <QuerySnapshot>(
            stream: getVideosPath(_firestore).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                final videoList = snapshot.data!.docs;
                final List<Widget> widgetsList = [];

                for (var videoId in videoList){
                  final toAddWidget = ReusableVideoCard(video_id: videoId['videoID']);
                  widgetsList.add(toAddWidget);
                }
                return Column(children: widgetsList);

              } else {
                return const Center(child: Text('No data', style: TextStyle(color: Colors.black),),);
              }
            })
      ]),
    );
  }
}
