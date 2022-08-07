import 'package:flutter/material.dart';
import 'package:yt_app/screens/videos.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InputFormS extends StatelessWidget {
  InputFormS({Key? key}) : super(key: key);

  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          'https://logodownload.org/wp-content/uploads/2018/09/youtube-go-logo-5.png',
          width: 120,
        ),
        const SizedBox(height: 50),
        ReusableInput(
          controller: controllerEmail,
          label: 'E-mail',
          type: TextInputType.emailAddress,
        ),
        ReusableInput(
          controller: controllerPass,
          label: 'Password',
          type: TextInputType.visiblePassword,
        ),
        const SizedBox(height: 30),
        GestureDetector(
          child: const ReusableButton(text: 'Login'),
          onTap: () async {
            try {
              final user = await _auth.signInWithEmailAndPassword(
                  email: controllerEmail.text, password: controllerPass.text);
              print(user);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideosScreen(),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
        ),
        GestureDetector(
          child: const ReusableButton(text: 'Register'),
          onTap: () async {
            try {
              final newUser = await _auth.createUserWithEmailAndPassword(
                  email: controllerEmail.text, password: controllerPass.text);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideosScreen(),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
        )
      ],
    );
  }
}

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.only(bottom: 9.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.red),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ReusableInput extends StatelessWidget {
  const ReusableInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.type,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.only(bottom: 30),
      child: TextField(
        keyboardType: type,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
