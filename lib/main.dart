import 'package:flutter/material.dart';
import 'package:yt_app/screens/login.dart';
import 'package:yt_app/screens/player.dart';
import 'screens/videos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: VideosScreen(),
    );
  }
}