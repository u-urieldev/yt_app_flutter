import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DialogReusable extends StatelessWidget {
  const DialogReusable({
    Key? key,
    required this.videoIDController,
    required this.dbAction
  }) : super(key: key);

  final TextEditingController videoIDController;
  final Function dbAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 270),
      title: const Text('Enter an ID YouTube Video'),
      content:
          Center(child: TextField(controller: videoIDController)),
      actions: [
        TextButton(
            onPressed: () {
              dbAction(FirebaseFirestore.instance, videoIDController.text);
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK')),
        TextButton(
            onPressed: () => Navigator.pop(context, 'CANCEL'),
            child: const Text('Cancel')),
      ],
    );
  }
}