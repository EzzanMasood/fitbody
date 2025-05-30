import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';

class NutritionSearchesScreen extends StatefulWidget {
  const NutritionSearchesScreen({super.key});

  @override
  State<NutritionSearchesScreen> createState() => _NutritionSearchesScreenState();
}

class _NutritionSearchesScreenState extends State<NutritionSearchesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> topSearches = [
      "Breakfast",
      "yogurt",
      "Vegetarian",
      "smoothie",
      "chicken"
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          const Text(
            "Top Searches",
            style: TextStyle(
              color: AppColors.yellow,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: topSearches.length,
              itemBuilder: (context, index) {
                return _topSearchItem(topSearches[index]);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _topSearchItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.yellow,
              child: const Icon(Icons.search, color: AppColors.darkpurple),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
