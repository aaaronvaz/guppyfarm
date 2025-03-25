import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Error Caught'),
            SizedBox(height: 15),
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Home');
              },
              icon: Icon(Icons.home, size: 50),
            ),
            SizedBox(height: 2),
            const Text('Back Home'),
          ],
        ),
      ),
    );
  }
}
