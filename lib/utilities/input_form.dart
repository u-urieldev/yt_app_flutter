import 'package:flutter/material.dart';
import 'package:yt_app/screens/videos.dart';

class InputFormS extends StatelessWidget {
  InputFormS({Key? key}) : super(key: key);

  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();

  void register() async {
    print('Register User');
  }

  void login() async {
    print('User login');
  }

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
        ReusableInput(controller: controllerEmail, label: 'E-mail'),
        ReusableInput(controller: controllerPass, label: 'Password'),
        const SizedBox(height: 30),
        GestureDetector(
          child: const ReusableButton(text: 'Login'),
          onTap: () {
            login();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VideosScreen(),
              ),
            );
          },
        ),
        GestureDetector(
          child: const ReusableButton(text: 'Register'),
          onTap: () {
            register();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideosScreen(),
              ),
            );
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
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.only(bottom: 30),
      child: TextField(
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
