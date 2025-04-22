import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/workout/advanced/advancedworkoutscreen.dart';
import 'package:flutter/material.dart';

class Adavncedworkout extends StatefulWidget {
  const Adavncedworkout({super.key});

  @override
  State<Adavncedworkout> createState() => _AdavncedworkoutState();
}

class _AdavncedworkoutState extends State<Adavncedworkout> {
  final List<Map<String, String>> trainings = [
    {
      "title": "cardio boxing",
      "duration": "50 Minutes",
      "calories": "1300 Kcal",
      "exercises": "5 Exercises",
      "imagePath": "assets/images/workout/advone.png",
    },
    {
      "title": "Hypertrophy - Legs",
      "duration": "6 Minutes",
      "calories": "200 Cal",
      "exercises": "2 Exercises",
      "imagePath": "assets/images/workout/advtwo.png",
    },
    {
      "title": "Rest or Active Recovery ",
      "duration": "12 Minutes",
      "calories": "1250 Kcal",
      "exercises": "5 Exercises",
      "imagePath": "assets/images/workout/advthree.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdvancedWorkoutScreen()));
            },
            child: Container(
                    width: 350,
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
                                'assets/images/workout/imgthree.png',
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
                                  'Training Of The Day',
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
                                'Upper Body Strength',
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
                                        '45 Minutes',
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
                                        '1450 Kcal',
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
       const SizedBox(height: 10,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableTextWidget(text: "Unlock Your Potential",textColor:AppColors.yellow,fontSize: 18,),
                ReuseableTextWidget(text: "Explore Advanced Fitness Routines",textColor: AppColors.white,fontSize: 12,),
              ],
            ),
 const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: trainings.length,
            itemBuilder: (context, index) {
              final training = trainings[index];
              return _buildTrainingCard(
                title: training["title"]!,
                duration: training["duration"]!,
                calories: training["calories"]!,
                exercises: training["exercises"]!,
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
    required String exercises,
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
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      exercises,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
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
