import 'package:flutter/material.dart';
import 'package:guppy_farm/Module/base.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Wish List',
      body: const Center(child: Text('WishList')),
    );
  }
}
