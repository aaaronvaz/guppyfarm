import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YtButton extends StatelessWidget {
  const YtButton({super.key});

  Future<void> openYouTube() async {
    final Uri url = Uri.parse("https://www.youtube.com/@blrguppyfarm");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Could not launch youtube";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openYouTube(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(width: 2, color: Colors.red),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('Assets/Icons/yt.png', width: 25, height: 25),
            SizedBox(width: 4),
            Text(
              "Check Out Now",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
