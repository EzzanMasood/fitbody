import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/mealideas_provider.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/nutrition/mealideas/breakfastscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealIdeasScreen extends StatefulWidget {
  const MealIdeasScreen({super.key});

  @override
  State<MealIdeasScreen> createState() => _MealIdeasScreenState();
}

class _MealIdeasScreenState extends State<MealIdeasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const ReuseableTextWidget(
          text: "Meal Ideas",
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
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                icon: const Icon(Icons.search),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationScreen()),
                  );
                },
                icon: const Icon(Icons.notifications),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProfileScreen()),
                  );
                },
                icon: const Icon(Icons.person),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
 body: Consumer<MealideasProvider>(builder: (context,provider,child){
  return Column(
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
                                text: "Breakfast",
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
                                text: "Lunch",
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
                                text: "Dinner",
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
                  if(provider.isSelected1)
                   Expanded(child: BreakFastScreen())
    ],
  );
 }),
    );
  }
}