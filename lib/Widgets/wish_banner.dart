import 'package:flutter/material.dart';

class WishBanner {
  WishBanner({required this.context});

  final BuildContext context;

  void showBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        padding: const EdgeInsets.all(12),
        content: Expanded(
          child: Text(
            "Swipe Right To Clear A Product",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        leading: const Icon(Icons.info, color: Colors.blue),
        backgroundColor: Colors.blue.shade100,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              "DISMISS",
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
