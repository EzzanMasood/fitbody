import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Darkandlight extends StatefulWidget {
  const Darkandlight({super.key});

  @override
  State<Darkandlight> createState() => _DarkandlightState();
}

class _DarkandlightState extends State<Darkandlight> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            // Get.bottomSheet()
          }, child: Text("Dark adn Light Theme"))
        ],
      ),
    );
  }
}