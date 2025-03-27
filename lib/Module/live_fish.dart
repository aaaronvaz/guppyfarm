import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';
import 'package:guppy_farm/Widgets/fish_card.dart';
import 'package:guppy_farm/Service/firestore_service.dart';

class LiveFish extends StatefulWidget {
  const LiveFish({super.key});

  @override
  State<LiveFish> createState() => _LiveFishState();
}

class _LiveFishState extends State<LiveFish> {
  final FirestoreService _firestoreService = FirestoreService();
  List<Map<String, dynamic>> fishList = [];
  bool isLoading = true; // Added loading state

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true; // Start loading
    });

    List<Map<String, dynamic>> data = await _firestoreService.getFish();
    print('worklist');

    setState(() {
      fishList = data;
      isLoading = false; // Stop loading
    });
  }

  void toggleFavorite(String fishId, bool currentFav) async {
    await _firestoreService.toggleFavorite(fishId, currentFav);
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Live Fishes',
      body:
          isLoading
              ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
              : fishList.isEmpty
              ? const Center(child: Text("No fishes available"))
              : LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:
                            fishList.map((fish) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: FishCard(item: fish),
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
