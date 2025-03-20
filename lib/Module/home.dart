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
              const Text(
                'Bangalore Guppy Farm',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
              ),
              const SizedBox(height: 8),
              const Text(
                '🐠 Bringing Life to Your Aquarium! 🐠',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 4),
              const Divider(color: Colors.blueGrey),
              const SizedBox(height: 4),
              Carousel(),
              const SizedBox(height: 8),
              YtPlayer(),
            ],
          ),
        ),
      ),
    );
  }
}
