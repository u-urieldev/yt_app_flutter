import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    Key? key,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableInput(controller: controllerEmail, label: 'E-mail'),
        ReusableInput(controller: controllerPass, label: 'Password'),
        const SizedBox(height: 30),
        ReusableButton(controllerEmail: controllerEmail, controllerPass: controllerPass, text: 'Login'),
        ReusableButton(controllerEmail: controllerEmail, controllerPass: controllerPass, text: 'Register'),
      ],
    );
  }
}

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.controllerEmail,
    required this.controllerPass,
    required this.text,
  }) : super(key: key);

  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(controllerEmail.text + controllerPass.text),
      child: Container(
        width: 200,
        height: 50,
        margin: const EdgeInsets.only(bottom: 9.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.red),
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.black),),
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
      margin: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white)),  
      ),
    );
  }
}
