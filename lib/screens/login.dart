import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> 
  with SingleTickerProviderStateMixin {

    ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.white,
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
      body: SafeArea(
        child: Stack(children: [
          Image.network(
            'https://meedios.com/wp-content/uploads/2020/10/yt.jpg',
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Color.fromARGB(123, 180, 176, 176)),
            ),
          ),
          AnimatedBackground(child: Container(), vsync: this, behaviour: RandomParticleBehaviour(options: particles)),

        ]),
      ),
    );
  }
}
