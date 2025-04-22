import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/nutrition/mealplans/breakfastplan.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
    (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>BreakFastPlanScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor:AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/mealideas/loading.png"),
              const SizedBox(height: 20),
             ReuseableTextWidget(text: "Creating a plan for you",textColor: AppColors.yellow,
             fontSize: 20,
             )
            ],
          ),
        ),
    );
  }
}