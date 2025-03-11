import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('Assets/logo.png', fit: BoxFit.cover),
            Text(title.toString()),
          ],
        ),
      ),
    );
  }
}
