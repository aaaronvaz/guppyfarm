import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, '/Home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlue], // Customize colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.7],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/logo.png',
                height: 300,
                width: 350,
                fit: BoxFit.contain,
              ),
              Lottie.asset(
                'Assets/Animations/fish_jump.json',
                fit: BoxFit.cover,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
