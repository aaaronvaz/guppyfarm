import 'package:flutter/material.dart';
import 'package:guppy_farm/Service/firestore_service.dart';
import 'package:shimmer/shimmer.dart';

class FishCard extends StatefulWidget {
  const FishCard({super.key, required this.item});

  final Map<String, dynamic>? item; // Allow null values

  @override
  State<FishCard> createState() => _FishCardState();
}

class _FishCardState extends State<FishCard> {
  late bool isFav;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    isFav = widget.item?['fav'] ?? false;
  }

  void toggleFavorite() async {
    if (widget.item == null || widget.item!['id'] == null) return;

    String fishId = widget.item!['id'];
    await _firestoreService.toggleFavorite(fishId, isFav); 
    setState(() {
      isFav = !isFav;
    });
    showSnackBar(context, '${widget.item!['name'] ?? 'Fish'}Liked');
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
    if (widget.item == null) {
      return _loadingPlaceholder();
    }

    return GestureDetector(
      onTap: () {
        if (widget.item == null) return;
        Navigator.pushNamed(
          context,
          '/FishDetails',
          arguments: {'fishItem': widget.item},
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 177, 216, 235),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 2,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: widget.item?['imageUrl'] != null
                      ? Image.network(
                          widget.item!['imageUrl'],
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
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : null,
                    ),
                    onPressed: toggleFavorite,
                    splashRadius: 20,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.item?['name'] ?? 'Unknown',
                      style: const TextStyle(
                        overflow: TextOverflow.clip,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔄 Shimmer effect placeholder
  Widget _loadingPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  /// ❌ Error placeholder
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
