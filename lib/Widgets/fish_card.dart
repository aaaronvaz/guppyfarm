import 'package:flutter/material.dart';
import 'package:guppy_farm/Data/fish.dart';
import 'package:guppy_farm/Data/ddata.dart';

class FishCard extends StatefulWidget {
  const FishCard({super.key, required this.item, required this.onFavorite});

  final Fish item;
  final VoidCallback onFavorite;

  @override
  State<FishCard> createState() => _FishCardState();
}

class _FishCardState extends State<FishCard> {
  late bool isFav;
  var data = DData();

  @override
  void initState() {
    super.initState();
    isFav = widget.item.fav;
  }

  void toggleFavorite(BuildContext ctx, Fish f) {
    data.toggleFavorite(widget.item);
    setState(() {
      isFav = !isFav;
    });
    //onFavorite(ctx);
  }

  void onCancel(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  void onFavorite(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 900),
        content: Text(
          '${widget.item.name} Liked',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        //backgroundColor: const Color.fromARGB(255, 56, 161, 247),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('FishDetails');
        //Navigator.pushReplacementNamed(context, '/test-page');
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
                  child: Image.asset(
                    widget.item.imgPath,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
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
                    onPressed: () {
                      toggleFavorite(context,widget.item);
                    },
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
                      widget.item.name,
                      style: const TextStyle(
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
}
