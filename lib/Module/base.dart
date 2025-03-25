import 'package:flutter/material.dart';
import 'package:guppy_farm/widgets/app_drawer.dart';
import 'package:guppy_farm/Utils/key.dart';
import 'package:guppy_farm/Widgets/floating_button.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final bool enableFloat;

  BaseScreen({super.key, required this.title, required this.body})
    : enableFloat = title == "About Us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(child: body),
      floatingActionButton: enableFloat ? const FloatingButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
