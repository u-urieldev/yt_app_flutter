import 'package:flutter/material.dart';
import '../utilities/reusableVideoCard.dart';

class VideosScreen extends StatefulWidget {
  VideosScreen({Key? key}) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  List<String> videoIDList = ['A_g3lMcWVy0', 'ErP_xomHKTw', ]; //'L2cnLYuTuuQ'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: videoIDList.length,
          itemBuilder: (BuildContext context, int index) {
            return ReusableVideoCard(video_id: videoIDList[index]);
          },
        ),
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
                        setState(() {
                          videoIDList.add(videoIDController.text); //y2P203hAAy8
                        });
                        Navigator.pop(context, 'CANCEL');
                      },
                      child: const Text('OK')),
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'CANCEL'),
                      child: const Text('Cancel')),
                ],
              );
            }),
        child: Icon(Icons.add),
      ),
    );
  }
}
