import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import '../utilities/input_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
  with SingleTickerProviderStateMixin {

  ParticleOptions particles = const ParticleOptions(
  baseColor: Colors.red,
  spawnOpacity: 0.0,
  opacityChangeRate: 0.25,
  minOpacity: 0.1,
  maxOpacity: 0.4,
  particleCount: 20,
  spawnMaxRadius: 9.0,
  spawnMaxSpeed: 50.0,
  spawnMinSpeed: 15,
  spawnMinRadius: 4.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Center(
            child: InputFormS(),
          ),
        ),
      ),
    );
  }
}