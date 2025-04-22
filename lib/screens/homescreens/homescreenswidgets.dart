import 'package:fitbody/config/colors.dart';
import 'package:fitbody/screens/nutrition/nutritionscreen.dart';
import 'package:fitbody/screens/progress_tracking/progresstracking.dart';
import 'package:fitbody/screens/workout/workout.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color imageColor;
  final double? imageSize; // Optional parameter for image size

  const FeatureItem({
    super.key,
    required this.imagePath,
    required this.text,
    required this.imageColor,
    this.imageSize,  // Optional parameter, defaults to null
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            color: imageColor,
            width: imageSize ?? 40,  
            height: imageSize ?? 40, 
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkpurple,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 1,
      color: AppColors.darkpurple,
      margin: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: GestureDetector(
              onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const WorkoutScreen()));       
              },
              child: const FeatureItem(
                imagePath: 'assets/images/home/logoone.png', 
                text: 'Workout',
                imageColor: Colors.yellow,
                imageSize: 55, 
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const DividerLine(),
          GestureDetector(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProgressTrackingScreen()));   
            },
            child: const FeatureItem(
              imagePath: 'assets/images/home/logotwo.png', 
              text: 'Progress\nTracking',
              imageColor: AppColors.darkpurple,
                    
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const DividerLine(),
          GestureDetector(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const NutritionScreen()));   
            },
            child: const FeatureItem(
              imagePath: 'assets/images/home/logothree.png',  
              text: 'Nutrition',
              imageColor: AppColors.darkpurple,
                  
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const DividerLine(),
          const FeatureItem(
            imagePath: 'assets/images/home/logofour.png',
            text: 'Community',
            imageColor: AppColors.darkpurple,
            
          ),
        ],
      ),
    );
  }
}



class ArticleItem extends StatefulWidget {
  final String imagePath;
  final String title;

  const ArticleItem({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  _ArticleItemState createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                 height: 120,
                width: 150,
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(
                  Icons.star,
                  color: isFavorite ? Colors.yellow : Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
