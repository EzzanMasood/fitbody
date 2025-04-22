import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';

class FavoriteArticleScreen extends StatefulWidget {
  const FavoriteArticleScreen({super.key});

  @override
  State<FavoriteArticleScreen> createState() => _FavoriteArticleScreenState();
}

class _FavoriteArticleScreenState extends State<FavoriteArticleScreen> {
  final List<Map<String, dynamic>> trainings = [
    {
      "title": "Boost Energy And Vitality",
      "subtitle": "Incorporating physical exercise into your daily routine can boost...",
      "imagePath": "assets/images/favorites/imgone.png",
    },
    {
      "title": "Avocado And Egg Toast",
      "duration": "15 Minutes",
      "calories": "150 Cal",
      "imagePath": "assets/images/favorites/imgtwo.png",
    },
    {
      "title": "Lower Body Blast",
      "subtitle": "A lower body blast is a high-intensity workout focused on targeting...",
      "imagePath": "assets/images/favorites/imgthree.png",
    },
    {
      "title": "Fruit Smoothie",
      "duration": "12 Minutes",
      "calories": "120 Cal",
      "imagePath": "assets/images/favorites/imgfour.png",
    },
    {
      "title": "Hydrate Properly",
      "subtitle": "Stay hydrated before, during, and after your workouts to optimize...",
      "imagePath": "assets/images/favorites/imgfive.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Expanded( // Ensures ListView.builder is scrollable
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: trainings.length,
            physics: const AlwaysScrollableScrollPhysics(), // Enables smooth scrolling
            itemBuilder: (context, index) {
              final training = trainings[index];
              return _buildTrainingCard(
                title: training["title"]!,
                subtitle: training["subtitle"],
                duration: training["duration"],
                calories: training["calories"],
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
    String? subtitle,
    String? duration,
    String? calories,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                if (subtitle != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ] else if (duration != null && calories != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.local_fire_department, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          calories,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
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
                child: Icon(Icons.star, size: 16, color: AppColors.yellow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}