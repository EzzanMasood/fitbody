import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/setup/goalsetup.dart';
import 'package:fitbody/screens/setup/heightsetup_widget.dart';
import 'package:fitbody/screens/setup/physicalactivitylevel.dart';
import 'package:flutter/material.dart';

class HeightSetUpScreen extends StatefulWidget {
  const HeightSetUpScreen({super.key});

  @override
  State<HeightSetUpScreen> createState() => _HeightSetUpScreenState();
}

class _HeightSetUpScreenState extends State<HeightSetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const ReuseableTextWidget(
          text: "Back",
          textColor: AppColors.yellow,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
             Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: AppColors.yellow,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
            const SizedBox(
            height: 40,
          ),
          const Center(
            child: ReuseableTextWidget(
              text: "What is your Height?",
              fontSize: 24,
              textColor: AppColors.white,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ReuseableTextWidget(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const ReuseableTextWidget(
            text: " sed do eiusmod tempor incididunt ut labore et dolore",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const ReuseableTextWidget(
            text: "magna aliqua",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const Expanded(child: HeightPicker()),

         CustomButton(
                  onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context)=>const GoalSetUpScreen()));
                           
                  },
                  border: Border.all(color: AppColors.white),
                  color: AppColors.button,
                  borderRadius: BorderRadius.circular(30),
                  height: 50,
                  width: 170,
                  child: const ReuseableTextWidget(
                    text: "Continue",
                    textColor: AppColors.white,
                    fontFamily: "Poppins",
                  )),
        ],
      ),
    );
  }
}