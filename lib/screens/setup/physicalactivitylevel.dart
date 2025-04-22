import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/physical_activity_provider.dart';
import 'package:fitbody/screens/setup/profilesetup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

class PhysicalActivityLevelScreen extends StatelessWidget {
  const PhysicalActivityLevelScreen({super.key});

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
      body: Consumer<PhysicalActivityProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: ReuseableTextWidget(
                  text: "Physical Activity Goal",
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
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => provider.setSelected(1),
                    child: Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: provider.isSelected1
                            ? AppColors.yellow
                            : AppColors.white,
                      ),
                      child: Center(
                        child: ReuseableTextWidget(
                          text: "Beginner",
                          textColor: provider.isSelected1
                              ? AppColors.black
                              : AppColors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => provider.setSelected(2),
                    child: Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: provider.isSelected2
                            ? AppColors.yellow
                            : AppColors.white,
                      ),
                      child: Center(
                        child: ReuseableTextWidget(
                          text: "Intermediate",
                          textColor: provider.isSelected2
                              ? AppColors.black
                              : AppColors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => provider.setSelected(3),
                    child: Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: provider.isSelected3
                            ? AppColors.yellow
                            : AppColors.white,
                      ),
                      child: Center(
                        child: ReuseableTextWidget(
                          text: "Advanced",
                          textColor: provider.isSelected3
                              ? AppColors.black
                              : AppColors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSetUpScreen(),
                    ),
                  );
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
