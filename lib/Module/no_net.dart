import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoNet extends StatelessWidget {
  const NoNet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'Assets/Animations/no_net.json',
                fit: BoxFit.cover,
                height: 300,
                width: 350,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/Home');
                },
                label: Text(
                  'Home',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                icon: Icon(Icons.home, size: 35, color: Colors.yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
