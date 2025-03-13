import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

import 'package:guppy_farm/Data/fish.dart';
import 'package:guppy_farm/Data/dummy_data.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final data = DummyData();
  late List<Fish> wishList;

  @override
  void initState() {
    super.initState();
    wishList = data.wishList;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Wish List',
      body:
          wishList.isEmpty
              ? Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blueGrey),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Empty'),
                      OutlinedButton.icon(
                        label: const Text('Add Fishes'),
                        icon: const Icon(Icons.add_box_outlined, size: 40),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
              : ListView.builder(
                itemCount: wishList.length,
                itemBuilder: (context, index) {
                  final fish = wishList[index];

                  return Dismissible(
                    key: ValueKey(fish.name), // Unique key for each item
                    direction:
                        DismissDirection.startToEnd, // Swipe right to remove
                    onDismissed: (direction) {
                      setState(() {
                        fish.fav = false; // Unfavorite the fish
                        wishList = data.wishList; // Update the list
                      });
                    },
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // Rounded image
                          child: Image.asset(
                            fish.imgPath,
                            width: 80,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(fish.name),
                        subtitle: Text(fish.type),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              fish.fav = false;
                              wishList = data.wishList;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
