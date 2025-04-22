import 'dart:async';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/onboardingscreens/onboardingscreens.dart'; 
import 'package:flutter/material.dart';

class OnBoardingScreena extends StatefulWidget {
  const OnBoardingScreena({super.key});

  @override
  State<OnBoardingScreena> createState() => _OnBoardingScreenaState();
}

class _OnBoardingScreenaState extends State<OnBoardingScreena> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds:3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Onboardingscreens()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/onboardinga.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const ReuseableTextWidget(
                text: "Welcome to",
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                textColor: AppColors.yellow,
              ),
              const SizedBox(height: 10,),
              Image.asset("assets/logos/logoone.png"),
              const SizedBox(height: 10),
              Image.asset("assets/logos/logotwo.png"),
            ],
          ),
        ),
      ),
    );
  }
}
