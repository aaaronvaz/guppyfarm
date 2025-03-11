import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      child: Icon(Icons.message_rounded),
      onPressed: () => _showContactOptions(context),
    );
  }
}

void _showContactOptions(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.call, color: Colors.green),
              title: Text("Call"),
              onTap: () {
                Navigator.pop(context);
                // Add calling functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.purple),
              title: Text("Instagram"),
              onTap: () {
                Navigator.pop(context);
                // Add Instagram opening functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library, color: Colors.red),
              title: Text("YouTube"),
              onTap: () {
                Navigator.pop(context);
                // Add YouTube opening functionality here
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.cancel, color: Colors.grey),
              title: Text("Cancel"),
              onTap: () => Navigator.pop(context), // Close sheet
            ),
          ],
        ),
      );
    },
  );
}
