import 'package:flutter/material.dart';

class HomePageScreenWidgetSceen extends StatelessWidget {
  const HomePageScreenWidgetSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SQFLite")),
      body: const Column(
        children: [Text("hello World")],
      ),
    );
  }
}
