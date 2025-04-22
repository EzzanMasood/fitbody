import 'package:fitbody/provider/workout_provider.dart';
import 'package:fitbody/screens/workout/advanced/advancedworkout.dart';
import 'package:fitbody/screens/workout/begiiner/beginerworkout.dart';
import 'package:fitbody/screens/workout/begiiner/intermediate/intermediateworkout.dart';
import 'package:provider/provider.dart'; 
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const ReuseableTextWidget(
          text: "Workout",
          textColor: AppColors.darkpurple,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow),
        ),
        backgroundColor: AppColors.backgroundColor,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(Icons.search),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
                icon: const Icon(Icons.notifications),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfileScreen()));
                },
                icon: const Icon(Icons.person),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<WorkoutProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(1),
                          child: Container(
                            height: 30,
                            width: 100,
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
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(2),
                          child: Container(
                            height: 30,
                            width: 100,
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
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(3),
                          child: Container(
                            height: 30,
                            width: 100,
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
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (provider.isSelected1)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const Beginerworkout(),
                    ),
                      if (provider.isSelected2)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const Intermediateworkout(),
                    ),
                      if (provider.isSelected3)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const Adavncedworkout(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
