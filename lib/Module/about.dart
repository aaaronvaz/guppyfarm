import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'About Us',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Our work..',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Spacer for better UI
            Expanded(
              child: SingleChildScrollView(
                child: RichText(
                  textAlign: TextAlign.start, // Ensures text is centered
                  text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'BLR Guppy Farm\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Online Retail Dealers and Sole Breeders For Imported Guppy Fish\n\n',
                      ),
                      TextSpan(
                        text: '- 100% Quality Assured -\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Address: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            '14, 5th Cross Rd, Krishnappa Layout, Lingarajapuram, Bengaluru, Karnataka 560084',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Some Snapshots..',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
