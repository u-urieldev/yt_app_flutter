import 'package:flutter/material.dart';
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
      title: 'YouTube App',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not YouTube"),
      ),
      body: Center(
        child: ListView(
          children: [
            // video_id is the last part in a YouTube link video
            ReusableVideoCard(video_id: 'A_g3lMcWVy0'),
            ReusableVideoCard(video_id: 'VRt66cN6PLw'),
          ],
        ),
      ),
    );
  }
}

