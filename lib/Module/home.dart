import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Featured Highlights"),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.red),
              child: const Text('Join Us On Youtube'),
            ),
          ],
        ),
      ),
    );
  }
}
