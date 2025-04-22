import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/nutrition/mealplans/avocadotoast.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

class BreakFastPlanScreen extends StatefulWidget {
  const BreakFastPlanScreen({super.key});

  @override
  State<BreakFastPlanScreen> createState() => _BreakFastPlanScreenState();
}

class _BreakFastPlanScreenState extends State<BreakFastPlanScreen> {
  int _selectedOption = 0;

  final List<Map<String, dynamic>> breakfastOptions = [
    {
      'title': 'Delights With Greek Yogurt',
      'time': '6 Minutes',
      'calories': '200 Cal',
      'image': 'assets/images/mealideas/imgfive.png',
    },
    {
      'title': 'Spinach And Tomato Omelette',
      'time': '10 Minutes',
      'calories': '220 Cal',
      'image': 'assets/images/mealideas/imgsix.png',
    },
    {
      'title': 'Avocado And Egg Toast',
      'time': '15 Minutes',
      'calories': '150 Cal',
      'image': 'assets/images/mealideas/imgseven.png',
    },
    {
      'title': 'Protein Shake With Fruits',
      'time': '9 Minutes',
      'calories': '180 Cal',
      'image': 'assets/images/mealideas/imgeight.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          "Meal Plans",
          style: TextStyle(
            color: AppColors.darkpurple,
            fontWeight: FontWeight.bold,
          ),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Breakfast Plan For You",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.yellow,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
              style: TextStyle(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: breakfastOptions.length,
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return breakfastItem(index);
                },
              ),
            ),
      
            Center(
              child: CustomButton(
                onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AvocadoToastScreen()));          
                },
                color: AppColors.yellow,
                height: 50,
                width: 160,
                borderRadius: BorderRadius.circular(30),
                child: Center(
                  child: ReuseableTextWidget(
                    text: "See Recipe",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70), 
          ],
        ),
      ),
    );
  }

  Widget breakfastItem(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio(
          value: index,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
          activeColor: AppColors.purple,
        ),
        Expanded(
          child: SizedBox(
            height: 90,
            child: Card(
              color: AppColors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            breakfastOptions[index]['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 16, color: AppColors.black),
                              Text(
                                breakfastOptions[index]['time'],
                                style: const TextStyle(color: AppColors.black, fontSize: 12),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.local_fire_department, size: 12, color: AppColors.black),
                              Text(
                                breakfastOptions[index]['calories'],
                                style: const TextStyle(color: AppColors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        breakfastOptions[index]['image'],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
