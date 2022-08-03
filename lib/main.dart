import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'yt_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'assets/reusableVideoCard.dart';

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
  String video_t = "";

  _setVideo() {
    _setYT().then((value) {
      setState(() {
        video_t = value;
      });
    });
  }

  Future<String> _setYT() async {
    var yt = YoutubeExplode();
    Video video =
        await yt.videos.get('https://www.youtube.com/watch?v=A_g3lMcWVy0');

    print(video.title);
    print(video);

    return video.title;
  }

  @override
  void initState() {
    // _setVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not YouTube"),
      ),
      body: Center(
        child: ListView(
          children: [
            ReusableVideoCard(image: 'https://getwallpapers.com/wallpaper/full/3/d/3/1193570-vivid-wallpaper-1920x1080-for-phone.jpg',
            text: 'Video 1',),
            ReusableVideoCard(image: 'https://4.bp.blogspot.com/-JTVZ2ajkvrU/UiIb8LLrIII/AAAAAAAAGb4/ioF8FtLFzR0/s1600/1307306470-nature_wallpaper_hd_hd_nature_3.jpg',
            text: 'Video 2 with a large video nameeee nameee',),
            ReusableVideoCard(image: 'https://3.bp.blogspot.com/-SDHyhNKdNT4/VZJQ1qy2MRI/AAAAAAAAR5E/7BTDMmC4YqQ/s1600/hd-wallpaper-03.jpg',
            text: 'Video 3 ',),
          ],
        ),
      ),
    );
  }
}

