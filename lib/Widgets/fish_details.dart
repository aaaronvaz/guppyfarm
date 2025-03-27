import 'package:flutter/material.dart';
import 'package:guppy_farm/Service/firestore_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:guppy_farm/Widgets/floating_button.dart';
import 'package:guppy_farm/Widgets/fish_desc.dart';

class FishDetails extends StatefulWidget {
  const FishDetails({
    super.key,
    required this.fishItem,
    required this.ctx,
  });

  final Map<String, dynamic>? fishItem;
  
  final BuildContext ctx; // Null safety

  @override
  State<FishDetails> createState() => _FishDetailsState();
}

class _FishDetailsState extends State<FishDetails> {
  late bool isFav;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    isFav = widget.fishItem?['fav'] ?? false; // Prevent crash if null
  }

  void toggleFavorite() async {
    if (widget.fishItem == null || widget.fishItem!['id'] == null) return;

    String fishId = widget.fishItem!['id'];
    await _firestoreService.toggleFavorite(fishId, isFav);
    setState(() {
      isFav = !isFav;
    });
    showSnackBar(context, '${widget.fishItem!['name'] ?? 'Fish'}Liked');
  }

  void showSnackBar(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 900),
        content: Text(
          message,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      body: SafeArea(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 2.5,
                      child: widget.fishItem?['imageUrl'] != null
                          ? Image.network(
                              widget.fishItem!['imageUrl'],
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return _loadingPlaceholder();
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return _errorPlaceholder();
                              },
                            )
                          : _loadingPlaceholder(),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(widget.ctx).pop();
                        },
                        splashRadius: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: toggleFavorite,
                        splashRadius: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.fishItem?['name'] ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pair",
                          style: TextStyle(fontSize: 18, color: Colors.black38),
                        ),
                        Text(
                          "₹550",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    FishDesc(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shimmer effect for loading state
  Widget _loadingPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// Error placeholder image
  Widget _errorPlaceholder() {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey[300],
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
        size: 50,
      ),
    );
  }
}
