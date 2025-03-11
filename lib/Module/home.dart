import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Home',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text('1'), Text('2'), Text('3'), Text('4')],
      ),
    );
  }
}
