import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'yt_player.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: YoutubePlayer.convertUrlToId(videoLink) ?? "",
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: false,
  //     mute: true,
  //     isLive: false,
  //   ),
  // );

  @override
  void deactivate() {
    //_controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not YouTube"),
      ),
      body: Center(
        child: Column(
          children: [
            YouTubeWidget(url: "https://www.youtube.com/watch?v=W-rHIsDFrzQ&t=317s&ab_channel=CarelessCoders"),
            // ----------------
            YouTubeWidget(url: "https://www.youtube.com/watch?v=3gU1OLKBcys&t=522s&ab_channel=LazyTechNo"),
          ],
        ),
      ),
    );
  }
}


