import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final List<Map<String, String>> images = [
    {"path": "Assets/Fishes/arm.png", "name": "Albino Red Guppy"},
    {"path": "Assets/Fishes/hbm.png", "name": "HB Male Guppy"},
    {"path": "Assets/Fishes/wtf.png", "name": "White TF Guppy"},
    {"path": "Assets/Fishes/ylf.png", "name": "Yello Lace Guppy"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      //decoration: BoxDecoration(color: Colors.lightBlue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 1,
        children: [
          Text(
            "Featured Fishes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          FlutterCarousel(
            options: FlutterCarouselOptions(
              height: 300,
              showIndicator: false,
              autoPlay: false,
              enableInfiniteScroll: true,
              //autoPlayInterval: Duration(seconds: 2),
              slideIndicator: CircularSlideIndicator(
                slideIndicatorOptions: SlideIndicatorOptions(
                  indicatorBorderColor: Colors.grey,
                  currentIndicatorColor: Colors.blue,
                ),
              ),
            ),
            items:
                images.map((imageData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              imageData["path"]!,
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
                              color: Color.fromRGBO(0, 0, 0, 0.6),
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
                }).toList(),
          ),
        ],
      ),
    );
  }
}
