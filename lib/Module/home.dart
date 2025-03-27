import 'package:flutter/material.dart';
import 'package:guppy_farm/Widgets/carousel.dart';
import 'package:guppy_farm/Widgets/yt_player.dart';
import 'package:guppy_farm/Module/base.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Home',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                'Bangalore Guppy Farm',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '🐠 Bringing Life to Your Aquarium! 🐠',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 17),
              ),
              const SizedBox(height: 4),
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 4),
              Carousel(),
              const SizedBox(height: 4),
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 4),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(220, 49, 157, 245),
                  /* gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 139, 210, 243), const Color.fromARGB(255, 49, 157, 245)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.4, 0.6],
                  ), */
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Do you know, Guppies help control mosquito populations by eating larvae in water?',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 4),
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 4),
              YtPlayer(),
            ],
          ),
        ),
      ),
    );
  }
}
