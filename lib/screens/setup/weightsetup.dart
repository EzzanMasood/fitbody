import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/setup/heightsetup.dart';
import 'package:fitbody/screens/setup/weightsetup_widget.dart';
import 'package:flutter/material.dart';

class WeightSetUpScreen extends StatefulWidget {
  const WeightSetUpScreen({super.key});

  @override
  State<WeightSetUpScreen> createState() => __WeightSetUpScreenState();
}

class __WeightSetUpScreenState extends State<WeightSetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              text: "What is your Weight?",
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
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.yellow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ReuseableTextWidget(
                  text: "KG",
                  textColor: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
                Image.asset("assets/images/setup/line.png"),
                const ReuseableTextWidget(
                  text: "LB",
                  textColor: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
              ],
            ),
          ),
          const Expanded(child: WeightPicker(),),
const SizedBox(height: 50,),
           CustomButton(
                  onTap: () {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>const HeightSetUpScreen()));              
                           
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
                  const SizedBox(height: 60,),
        ],
      ),
    );
  }
}
