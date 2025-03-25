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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome to Bangalore Guppy Farm',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset('Assets/logo.png', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text:
                              'At BLR Guppy Farm, we are passionate about breeding and supplying top-quality guppies.'
                              'We specialize in imported guppy strains as well as locally bred varieties, ensuring a wide selection for hobbyists, breeders, and aquarium enthusiasts.'
                              'Our farm is committed to providing healthy, vibrant, and genetically superior guppies with',
                        ),
                        TextSpan(
                          text: ' 100% ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: 'quality assurance.\n\n'),
                        TextSpan(
                          text: 'Our Commitment..\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        TextSpan(
                          text: 'Premium Quality:\t',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text:
                              'We carefully breed and source guppies from the best genetic lines.\n',
                        ),
                        TextSpan(
                          text: 'Healthy & Disease-Free Fish:\t',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text:
                              'All our guppies undergo strict health checks before delivery.\n',
                        ),
                        TextSpan(
                          text: 'Wide Variety:\t',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text:
                              'We offer exotic imports along with well-bred local guppies.\n',
                        ),
                        TextSpan(
                          text: 'Expert Care:\t',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text:
                              'Our team consists of experienced breeders who provide the best environment for fish growth.\n\n',
                        ),
                        TextSpan(
                          text: 'Address:\t',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              '14, 5th Cross Rd, Krishnappa Layout, Lingarajapuram, Bengaluru, Karnataka 560084\n\n',
                        ),
                        TextSpan(
                          text:
                              'For inquiries, orders, or expert advice, feel free to reach out to us.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            /* const Text(
              'Some Snapshots..',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), */
          ],
        ),
      ),
    );
  }
}
