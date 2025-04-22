import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/search_provider.dart';
import 'package:fitbody/screens/notification&searchscreens/allsearchscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/nutritionsearchscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/workoutsearchesscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(),
      child: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              titleSpacing: 0,
              title: const ReuseableTextWidget(
                text: "Search",
                textColor: AppColors.darkpurple,
                fontWeight: FontWeight.bold,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: AppColors.yellow),
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
                                builder: (context) =>
                                    const NotificationScreen()));
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
                                builder: (context) =>
                                    const MyProfileScreen()));
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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    hintText: "Search",
                    height: 30,
                    borderRadius: BorderRadius.circular(30),
                    hintTextColor: Colors.grey,
                  ),
                  const SizedBox(height: 20),
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
                                text: "All",
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
                                text: "Workout",
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
                                text: "Nutrition",
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
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: const AllSearchScreen(),
                    ),
                  if (provider.isSelected2)
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: const WorkoutSearchesScreen(),
                    ),
                  if (provider.isSelected3)
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: const NutritionSearchesScreen(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
