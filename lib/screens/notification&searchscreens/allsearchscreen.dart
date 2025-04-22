import 'package:fitbody/screens/homescreens/vedioswidget.dart';
import 'package:flutter/material.dart';

class AllSearchScreen extends StatefulWidget {
  const AllSearchScreen({super.key});

  @override
  State<AllSearchScreen> createState() => _AllSearchScreenState();
}

class _AllSearchScreenState extends State<AllSearchScreen> {
  final List<Map<String, String>> trainings = [
    {
      "title": "Circuit Training",
      "duration": "50 Minutes",
      "calories": "1300 Kcal",
      "exercises": "5 Exercises",
      "imagePath": "assets/images/search/imgone.png",
    },
    {
      "title": "Delights With Greek Yogurt",
      "duration": "6 Minutes",
      "calories": "200 Cal",
      "exercises": "2 Exercises",
      "imagePath": "assets/images/search/imgtwo.png",
    },
    {
      "title": "Split Strength ",
      "duration": "12 Minutes",
      "calories": "1250 Kcal",
      "exercises": "5 Exercises",
      "imagePath": "assets/images/search/imgthree.png",
    },
    {
      "title": "Turkey and Avocado Wrap",
      "duration": "12 Minutes",
      "calories": "1250 Kcal",
      "exercises": "5 Exercises",
      "imagePath": "assets/images/search/imgfour.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 180, 
          child: ExerciseCardList(),
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
    );
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
}
