import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

class SquatsWorkoutScreen extends StatefulWidget {
  const SquatsWorkoutScreen({super.key});

  @override
  State<SquatsWorkoutScreen> createState() => _SquatsWorkoutScreenState();
}

class _SquatsWorkoutScreenState extends State<SquatsWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const ReuseableTextWidget(
          text: "Beginner",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/workout/begfour.png', 
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 20,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: AppColors.darkpurple,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Squats',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus libero eget.',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
             Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child:      const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color:AppColors.black, size: 16),
                          
                          Text(
                            '30 Seconds',
                            style: TextStyle(color: AppColors.black,fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(width: 4),
                      Row(
                        children: [
                          Icon(Icons.repeat, color: AppColors.black, size: 16),
                          
                          Text(
                            '3 Reps',
                            style: TextStyle(color: AppColors.black,fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(width: 4),
                      Row(
                        children: [
                          Icon(Icons.bar_chart, color: AppColors.black, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Beginner',
                            style: TextStyle(color:AppColors.black,fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
             )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
