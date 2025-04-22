import 'dart:async';
import 'package:fitbody/utils/firestore_utils.dart';
import 'package:flutter/material.dart';
import 'package:fitbody/config/colors.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () => FireStoreUtils().redirectScreen());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logos/logoone.png"),
            const SizedBox(height: 10),
            Image.asset("assets/logos/logotwo.png"),
          ],
        ),
      ),
    );
  }
}
