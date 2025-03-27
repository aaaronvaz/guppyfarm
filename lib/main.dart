import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:guppy_farm/Module/home.dart';
import 'package:guppy_farm/Module/about.dart';
import 'package:guppy_farm/Module/splash.dart';
import 'package:guppy_farm/Module/live_fish.dart';
import 'package:guppy_farm/Widgets/fish_details.dart';

import 'package:guppy_farm/Module/no_net.dart';
import 'package:guppy_farm/Module/error.dart';

import 'package:guppy_farm/Module/wish_list.dart';
import 'package:guppy_farm/firebase_options.dart';
import 'package:guppy_farm/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
await dotenv.load();
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
        '/Category/Live-Fishes': (context) => LiveFish(),
        '/Wish-List': (context) => WishList(),
        '/No-Network': (context) => const NoNet(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/FishDetails') {
          final args = settings.arguments as Map<String, dynamic>?;

          if (args != null && args.containsKey('fishItem')) {
            return MaterialPageRoute(
              builder:
                  (context) => FishDetails(
                    fishItem: args['fishItem'] as Map<String, dynamic>,
                    ctx: context,
                  ),
            );
          }
        }
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
      },
    );
  }
}
