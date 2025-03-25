import 'package:flutter/material.dart';
import 'package:guppy_farm/Data/fish.dart';
import 'package:guppy_farm/Widgets/floating_button.dart';
import 'package:guppy_farm/Widgets/fish_desc.dart';

class FishDetails extends StatefulWidget {
  const FishDetails({
    super.key,
    required this.fishItem,
    required this.ctx,
    /* required this.onCancel,
    required this.onFavorite, */
  });

  final Fish fishItem;
  final BuildContext ctx;
  /* final Function onCancel;
  final Function onFavorite; */

  @override
  State<FishDetails> createState() => _FishDetailsState();
}

class _FishDetailsState extends State<FishDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      body: SafeArea(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
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
                      child: Image.asset(
                        widget.fishItem.imgPath,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ) /* Image.asset(
                      widget.fishItem.imgPath,
                      width: 800,
                      height: 350,
                      fit: BoxFit.contain,
                    ), */,
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
                        } /* widget.onCancel(context) */,
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
                        icon:
                            widget.fishItem.fav
                                ? const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 30,
                                )
                                : const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.black26,
                                  size: 30,
                                ),
                        onPressed: () {} /* widget.onFavorite(context) */,
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
                      widget.fishItem.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    //const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pair",
                          style: TextStyle(fontSize: 18, color: Colors.black38),
                        ),
                        Text(
                          "₹${widget.fishItem.price.toStringAsFixed(2)}",
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
}
