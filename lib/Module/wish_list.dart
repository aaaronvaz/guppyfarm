import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:guppy_farm/Module/base.dart';
import 'package:guppy_farm/Widgets/wish_banner.dart';
import 'package:guppy_farm/Service/firestore_service.dart'; // Import Firestore service

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final FirestoreService _firestoreService = FirestoreService();
  late List<Map<String, dynamic>> wishList = [];
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchWishList();
  }

  // Fetch favorite fishes from Firestore
  Future<void> fetchWishList() async {
    List<Map<String, dynamic>> favorites =
        await _firestoreService.getFavoriteFish();
    if (mounted) {
      setState(() {
        wishList = favorites;
        isLoading = false;
      });

      if (wishList.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          WishBanner(context: context).showBanner();
        });
      }
    }
  }

  // Remove an item from the wishlist and update Firestore
  void removeItem(BuildContext ctx, Map<String, dynamic> fish) async {
    await _firestoreService.toggleFavorite(fish['id'], fish['fav']);

    setState(() {
      wishList.removeWhere((item) => item['id'] == fish['id']);
    });

    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2500),
        content: const Text('Product Erased'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            await _firestoreService.toggleFavorite(fish['id'], !fish['fav']);
            fetchWishList(); // Refresh list
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
          isLoading
              ? const Center(
                child: CircularProgressIndicator(),
              ) // Show loading indicator
              : wishList.isEmpty
              ? Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blueGrey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 250, 
                        width: 400, 
                        child: Lottie.asset(
                          'Assets/Animations/fishing.json',
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'No Fish Found.',
                      textAlign:
                          TextAlign.center, 
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: wishList.length,
                itemBuilder: (context, index) {
                  final fish = wishList[index];

                  return Dismissible(
                    key: ValueKey(fish['id']),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      removeItem(context, fish);
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
                              child: Image.network(
                                fish['imageUrl'],
                                width: 180,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    size: 100,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fish['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Pair",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '₹${550}',
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
                                removeItem(context, fish);
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
