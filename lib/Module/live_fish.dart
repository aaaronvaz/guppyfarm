import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';
import 'package:guppy_farm/Data/dummy_data.dart';
import 'package:guppy_farm/Widgets/fish_card.dart';

class LiveFish extends StatelessWidget {
  LiveFish({super.key});
  final data = DummyData();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Live Fishes',
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                    data.fishData.map((fish) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: FishCard(
                          item: fish,
                          /* onCancel: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${fish["name"]} removed!")),
                            );
                          }, */
                          onFavorite: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${fish.name} liked!")),
                            );
                          },
                        ), 
                      );
                    }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
