import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: false,
      elevation: 10,
      //label: const Text('Contact'),
      //icon: Icon(Icons.message_rounded),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.sms, size: 40),
      ),

      onPressed: () => _showContactOptions(context),
    );
  }
}

Future<void> openDialer() async {
  final Uri url = Uri(scheme: 'tel', path: '+919108837214');
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.platformDefault);
  } else {
    throw 'Dialer Unavailable';
  }
}

Future<void> openWhatsApp(String no) async {
  final Uri appUrl = Uri.parse("whatsapp://send?phone=+91$no");
  final Uri webUrl = Uri.parse("https://wa.me/+91$no");

  if (await canLaunchUrl(appUrl)) {
    await launchUrl(appUrl, mode: LaunchMode.externalApplication);
  } else {
    await launchUrl(webUrl, mode: LaunchMode.externalApplication);
  }
}

Future<void> openGmail() async {
  //Error
  /* final Uri emailUri = Uri(scheme: 'mailto', path: 'blrguppyfarm@gmail.com');
  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Gmail';
  } */
}

Future<void> openYouTube() async {
  final Uri url = Uri.parse("https://www.youtube.com/@blrguppyfarm");

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw "Could not launch youtube";
  }
}

Future<void> openInstagram() async {
  final Uri appUrl = Uri.parse("instagram://user?username=varghese_thomas_panicker");
  final Uri webUrl = Uri.parse("https://www.instagram.com/varghese_thomas_panicker/");

  if (await canLaunchUrl(appUrl)) {
    await launchUrl(appUrl, mode: LaunchMode.externalApplication);
  } else {
    await launchUrl(webUrl, mode: LaunchMode.externalApplication);
  }
}

void openSnackBar(BuildContext ctx, String txt) {
  ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(txt)));
}

void _showContactOptions(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isDismissible: true,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.call, color: Colors.green, size: 30),
                title: Text(
                  "Call",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  openDialer();
                },
              ),
              ListTile(
                leading: Image.asset(
                  'Assets/Icons/wa.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "WhatsApp",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  openWhatsApp('9108837214');
                },
              ),
              ListTile(
                leading: Image.asset(
                  'Assets/Icons/gm.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "Gmail",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                /* onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(text: 'blrguppyfarm@gmail.com'),
                  );

                  if (!context.mounted) {
                    return;
                  }

                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email Copied To Clipboard.')),
                    );
                  }
                  //Future.delayed(Duration.zero, () => Navigator.pop(context));
                }, */
                trailing: IconButton(
                  icon: Icon(Icons.copy, size: 30),
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: 'blrguppyfarm@gmail.com'),
                    );

                    if (!context.mounted) {
                      return;
                    }

                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email Copied To Clipboard.')),
                      );
                    }
                    //Future.delayed(Duration.zero, () => Navigator.pop(context));
                  },
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'Assets/Icons/ig.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "Instagram",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  openInstagram();
                },
              ),
              ListTile(
                leading: Image.asset(
                  'Assets/Icons/yt.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "YouTube",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  openYouTube();
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.grey, size: 30),
                title: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
