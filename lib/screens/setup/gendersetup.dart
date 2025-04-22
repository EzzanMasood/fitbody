import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/gender_selection_provider.dart';
import 'package:fitbody/screens/setup/agesetup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderSetUpScreen extends StatefulWidget {
  const GenderSetUpScreen({super.key});

  @override
  State<GenderSetUpScreen> createState() => _GenderSetUpScreenState();
}

class _GenderSetUpScreenState extends State<GenderSetUpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:Consumer<GenderSelectionProvider>(builder:(context, value, child) {
        return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              CustomButton(
                  onTap: () {
                     Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_ios_new,
                  iconColor: AppColors.yellow,
                  child: const ReuseableTextWidget(
                    text: "Back",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.yellow,
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              const ReuseableTextWidget(
                text: "What's Your Gender",
                fontSize: 24,
                textColor: AppColors.white,
                fontFamily: "Poppins",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: AppColors.purple,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: ReuseableTextWidget(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                      textColor: AppColors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => value.isSelected(1),
                child: Container(
                   height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:value.isSelected1 ? Colors.transparent: AppColors.white,),
                    color: value.isSelected1 ? AppColors.yellow: AppColors.button,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      "assets/images/setup/male.png",
                      
                      color: value.isSelected1?AppColors.black:AppColors.white,
                    ),
                  ),
                ),
              ),
              const ReuseableTextWidget(
                text: "Male",
                fontFamily: "Poppins",
                fontSize: 20,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => value.isSelected(2),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:value.isSelected2 ? Colors.transparent: AppColors.white,),
                    color: value.isSelected2 ? AppColors.yellow: AppColors.button,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      "assets/images/setup/female.png",
                 
                     color: value.isSelected2?AppColors.black:AppColors.white,
                    ),
                  ),
                ),
              ),
              const ReuseableTextWidget(
                text: "Female",
                fontFamily: "Poppins",
                fontSize: 20,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AgeSetUpScreen()));
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
          )
        ],
      );
      },)
    );
  }
}

