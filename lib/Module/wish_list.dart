import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

import 'package:guppy_farm/Data/fish.dart';
import 'package:guppy_farm/Data/ddata.dart';

import 'package:guppy_farm/Widgets/wish_banner.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final data = DData();
  late List<Fish> wishList;

  @override
  void initState() {
    super.initState();
    wishList = data.wishList;
    if (wishList.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        WishBanner(context: context).showBanner();
      });
    }
  }

  void removeItem(BuildContext ctx, Fish item) {
    int removedIndex = wishList.indexOf(item);
    Fish removedFish = item;

    setState(() {
      wishList.removeAt(removedIndex); // Remove fish from list
      //data.removeFromWishList(removedFish);
    });

    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2500),
        content: const Text('Product Erased'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            wishList.insert(removedIndex, removedFish); // Restore in list
            //data.addToWishList(removedFish);
          },
        ),
      ),
    );
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
                        removeItem(context, fish);
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                fish.imgPath,
                                width: 180, // Set a fixed width
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fish.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Pair",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '₹${fish.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  fish.fav = false;
                                  wishList = data.wishList;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
