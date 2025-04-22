import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/progress_tracking_provider.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:fitbody/screens/progress_tracking/Workoutlog.dart';
import 'package:fitbody/screens/progress_tracking/chartsscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          titleSpacing: 0,
          title: const ReuseableTextWidget(
            text: "Progress Tracking",
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
        body:Consumer<ProgressTrackingProvider>(builder:(context,value,child){
          return Column(
            children: [Visibility(
              visible: !value.isSelected2,
              child: Container(
                height: 120,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColors.purple,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Row(
                children: [
                  ReuseableTextWidget(
                    text: "Madison",
                    textColor: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    "assets/images/setup/female.png",
                    color: AppColors.yellow,
                    height: 18,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: const [
                  ReuseableTextWidget(
                    text: "Age: 28",
                    textColor: AppColors.white,
                    fontSize: 14,
                  ),
                  SizedBox(width: 15),
                  
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 5,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [ReuseableTextWidget(
                    text: "75 Kg",
                    textColor: AppColors.white,
                    fontSize: 14,
                  ),
                      ReuseableTextWidget(
                        text: "Weight",
                        textColor: AppColors.white,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 35,
                    width: 5,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ReuseableTextWidget(
                        text: "1.65 CM",
                        textColor: AppColors.white,
                        fontSize: 14,
                      ),
                      ReuseableTextWidget(
                        text: "Height",
                        textColor: AppColors.white,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
                        ],
                      ),
                    ),
              
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
              'assets/images/profile/profile.png',
              fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Column(
                  children: [
                    Row(
                             children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>value.isSelected(1),
                    child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: value.isSelected1
                                          ? AppColors.yellow
                                          : AppColors.white,
                                    ),
                                    child: Center(
                                      child: ReuseableTextWidget(
                                        text: "Workout log",
                                        textColor: value.isSelected1
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
                                     onTap: () =>value.isSelected(2),
                                     child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: value.isSelected2
                                          ? AppColors.yellow
                                          : AppColors.white,
                                    ),
                                    child: Center(
                                      child: ReuseableTextWidget(
                                        text: "charts",
                                        textColor: value.isSelected2
                                            ? AppColors.black
                                            : AppColors.purple,
                                      ),
                                    ),
                                  ),
                                   ),
                   ),
                             ],
                ),
                  ],
                ),
              ),
              SizedBox(height: 20,),


              if(value.isSelected1)
                Expanded(child: WorkoutLogScreen()),
              if(value.isSelected2)
                Expanded(child: ChartsScreen())
            ],
          );
        } )
  
          
        
    );
  }
}
