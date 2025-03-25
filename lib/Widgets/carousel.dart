import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final List<Map<String, String>> images = [
    {"path": "Assets/Fishes/arm.png", "name": "Albino Red Guppy"},
    {"path": "Assets/Fishes/hbm.png", "name": "HB Male Guppy"},
    {"path": "Assets/Fishes/wtf.png", "name": "White TF Guppy"},
    {"path": "Assets/Fishes/ylf.png", "name": "Yellow Lace Guppy"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Featured Fishes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          FlutterCarousel.builder(
            itemCount: images.length,
            itemBuilder: (context, index, _) {
              final imageData = images[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholderColor: Colors.white,
                          placeholder: AssetImage("Assets/logo.png"),
                          image: AssetImage(imageData["path"]!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          imageData["name"]!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            options: FlutterCarouselOptions(
              height: 270,
              viewportFraction: 0.8, // Optimized fraction for smooth swipes
              enableInfiniteScroll: true,
              showIndicator: false,
              //autoPlay: true,
              //autoPlayInterval:
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}
