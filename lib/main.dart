import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/home.dart';
import 'package:guppy_farm/Module/about.dart';
import 'package:guppy_farm/Module/splash.dart';
import 'package:guppy_farm/Module/wish_list.dart';
import 'package:guppy_farm/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Guppy Farm',
      theme: AppTheme.defaultTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/About': (context) => const About(),
        '/Contact': (context) => const Splash(title: '2'),
        '/Category/Live-Fishes': (context) => const Splash(title: '3'),
        '/Wish-List': (context) => const WishList(),
      },
    );
  }
}
