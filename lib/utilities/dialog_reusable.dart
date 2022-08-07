import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DialogReusable extends StatelessWidget {
  DialogReusable({Key? key, required this.videoIDController, required this.dbAction}) : super(key: key);

  final TextEditingController videoIDController;
  final Function dbAction;
  String titleText = 'Enter an ID YouTube Video';

  @override
  Widget build(BuildContext context) {
    Widget content =
        Center(child: TextField(controller: videoIDController));

    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 270),
          title: Text(titleText),
          content: content,
          actions: [
            TextButton(
                onPressed: () async {
                  setState(() {
                    content = CircularProgressIndicator();
                    titleText = "Uploading...";
                  });

                  await dbAction(FirebaseFirestore.instance,
                      videoIDController.text);
                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK')),
            TextButton(
                onPressed: () => Navigator.pop(context, 'CANCEL'),
                child: const Text('Cancel')),
          ],
        );
      }),
    );
  }
}