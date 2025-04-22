import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/homescreens/vedioswidget.dart';
import 'package:fitbody/screens/nutrition/mealplans/startingscreen.dart';
import 'package:flutter/material.dart';

class MealPlansScreen extends StatefulWidget {
  const MealPlansScreen({super.key});

  @override
  State<MealPlansScreen> createState() => _MealPlansScreenState();
}

class _MealPlansScreenState extends State<MealPlansScreen> {
  final List<Map<String, String>> trainings = [
    {
      "title": "Delights with Greek yogurt",
      "duration": "50 Minutes",
      "calories": "1300 Kcal",
      "imagePath": "assets/images/mealideas/imgtwo.png",
    },
    {
      "title": "Baked salmon",
      "duration": "6 Minutes",
      "calories": "200 Cal",
      "imagePath": "assets/images/mealideas/imgthree.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StartingScreen()));    
            },
            child: Container(
              height: 220,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/mealideas/imgone.png',
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Reciepe Of The Day',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 30,
                        left: 6,
                        child: Text(
                          'Carrot and orange smoothie',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.access_time, size: 14, color: Colors.white),
                                Text(
                                  '10 Minutes',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            const Row(
                              children: [
                                Icon(Icons.local_fire_department,
                                    size: 14, color: Colors.white),
                                Text(
                                  '70 cal',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            const Row(
                              children: [
                                Icon(Icons.fitness_center,
                                    size: 14, color: Colors.white),
                                SizedBox(width: 4),
                                Text(
                                  '5 Exercises',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(Icons.star_border,
                                  size: 30, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableTextWidget(
                  text: "Recommended",
                  textColor: AppColors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 180,
                  child: ExerciseCardList(),
                ),
                SizedBox(height: 10),
                ReuseableTextWidget(
                  text: "Recipes for you",
                  textColor: AppColors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: trainings.length,
              itemBuilder: (context, index) {
                final training = trainings[index];
                return _buildTrainingCard(
                  title: training["title"]!,
                  duration: training["duration"]!,
                  calories: training["calories"]!,
                  imagePath: training["imagePath"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTrainingCard({
  required String title,
  required String duration,
  required String calories,
  required String imagePath,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.local_fire_department,
                      size: 14, color: Colors.grey),
                  Text(
                    calories,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 4,
              right: 4,
              child: Icon(Icons.star, size: 16, color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}
