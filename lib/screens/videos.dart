import 'package:flutter/material.dart';
import '../utilities/reusableVideoCard.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ListView(
          children: [
            // video_id is the last part in a YouTube link video
            ReusableVideoCard(video_id: 'A_g3lMcWVy0'),
            ReusableVideoCard(video_id: 'ErP_xomHKTw'),
            ReusableVideoCard(video_id: 'L2cnLYuTuuQ'),
          
          ],
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
                content: Center(child: TextField(controller: videoIDController)),
                actions: [
                  TextButton(
                      onPressed: () => print(videoIDController.text),
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
