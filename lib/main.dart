import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:guppy_farm/Module/home.dart';
import 'package:guppy_farm/Module/about.dart';
import 'package:guppy_farm/Module/splash.dart';
import 'package:guppy_farm/Module/live_fish.dart';
import 'package:guppy_farm/Data/fish.dart';
import 'package:guppy_farm/Widgets/fish_details.dart';

import 'package:guppy_farm/Module/wish_list.dart';
import 'package:guppy_farm/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) => runApp(MyApp()));
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
        '/': (context) => const Splash(),
        '/Home': (context) => const Home(),
        '/About': (context) => const About(),
        '/Contact': (context) => const Splash(),
        '/Category/Live-Fishes': (context) => LiveFish(),
        '/Wish-List': (context) => WishList(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/FishDetails') {
          final args = settings.arguments as Map<String, dynamic>?;

          if (args != null && args.containsKey('fishItem')) {
            return MaterialPageRoute(
              builder: (context) => FishDetails(
                fishItem: args['fishItem'] as Fish,
                onCancel: args['onCancel'] as VoidCallback,
                onFavorite: args['onFavorite'] as VoidCallback,
              ),
            );
          }
        }
        return null;
      },
    );
  }
}
