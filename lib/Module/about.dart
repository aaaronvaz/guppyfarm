import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:guppy_farm/Module/base.dart';

class About extends StatelessWidget {
  const About({super.key});

  final double latitude = 13.007036341716127;
  final double longitude = 77.62891922205256;

  Future<void> _openGoogleMaps() async {
    final Uri googleMapsAppUrl = Uri.parse(
      "geo:$latitude,$longitude?q=$latitude,$longitude",
    );
    final Uri googleMapsWebUrl = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );

    if (await canLaunchUrl(googleMapsAppUrl)) {
      await launchUrl(googleMapsAppUrl, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(googleMapsWebUrl, mode: LaunchMode.externalApplication);
    }
  }

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
            Container(
              height: 65,
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Image.asset(
                    'Assets/Icons/map.png',
                    fit: BoxFit.contain,
                    height: 55,
                    width: 80,
                  ),
                ),
                onTap: () => _openGoogleMaps(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
