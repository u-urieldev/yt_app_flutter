import 'package:flutter/material.dart';
import '../assets/reusableVideoCard.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not-YouTube'),
      ),
      body: Center(
        child: ListView(
          children: [
            // video_id is the last part in a YouTube link video
            ReusableVideoCard(video_id: 'A_g3lMcWVy0'),
            ReusableVideoCard(video_id: 'Cr8K88UcO0s'),
            ReusableVideoCard(video_id: 'JKIHu7UPiV0'),
          ],
        ),
      ),
    );
  }
}
