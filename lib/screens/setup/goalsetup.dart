import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/goal_selection_provider.dart';
import 'package:fitbody/screens/setup/physicalactivitylevel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalSetUpScreen extends StatelessWidget {
  const GoalSetUpScreen({super.key});

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
      body: Consumer<GoalSelectionProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              const Center(
                child: ReuseableTextWidget(
                  text: "What is your Goal?",
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
                text: "sed do eiusmod tempor incididunt ut labore et dolore",
                textColor: AppColors.white,
                fontSize: 12,
              ),
              const ReuseableTextWidget(
                text: "magna aliqua",
                textColor: AppColors.white,
                fontSize: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.purple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      itemCount: provider.goals.length,
                      itemBuilder: (context, index) {
                        final goal = provider.goals[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: ListTile(
                            title: Text(
                              goal,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: AppColors.black,
                              ),
                            ),
                            trailing: Radio<String>(
                              value: goal,
                              groupValue: provider.selectedGoal,
                              activeColor: AppColors.black,
                              onChanged: (value) {
                                provider.setSelectedGoal(value!); 
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhysicalActivityLevelScreen(),
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
              const SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
