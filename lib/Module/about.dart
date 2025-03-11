import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'About Us',
      body: const Center(child: Text('About')),
    );
  }
}
