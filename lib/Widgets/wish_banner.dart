import 'package:flutter/material.dart';

class WishBanner {
  WishBanner({required this.context});

  final BuildContext context;

  void showBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        padding: const EdgeInsets.all(12),
        content: Expanded(
          child: const Text(
            "Swipe Right To Clear A Product",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        leading: const Icon(Icons.info, color: Colors.blue),
        backgroundColor: Colors.blue.shade100,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text("DISMISS", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
