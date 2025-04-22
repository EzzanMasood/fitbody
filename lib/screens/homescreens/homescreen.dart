import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/constants.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/homescreens/homescreenswidgets.dart';
import 'package:fitbody/screens/homescreens/vedioswidget.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';

import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

import '../notification&searchscreens/notificationscreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          titleSpacing: 0, 
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              ReuseableTextWidget(
                text: "Hi, Madison",
                textColor: AppColors.darkpurple,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
              ReuseableTextWidget(
                text: "Its time to challenge your limits.",
                textColor: AppColors.white,
                fontFamily: "Poppins",
                fontSize: 11.5,
              ),
            ],
          ),
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
      ),
      body: SingleChildScrollView(
        
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 75, child:  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FeatureList())),
              const SizedBox(height: 10),
              Row(
                children: [
                  const ReuseableTextWidget(
                    text: "Recommendations",
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.yellow,
                    fontSize: 16,
                  ),
                  const SizedBox(width: 50),
                  const ReuseableTextWidget(
                    text: "See all",
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.white,
                    fontSize: 16,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.yellow,
                    ),
                  ),
                ],
              ),
              const Expanded(
            
                child: ExerciseCardList()
                ),
              const SizedBox(height: 40),
              Container(
                
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.purple,
              
                ),
                width:double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 140,
            
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ReuseableTextWidget(
                                    text: "Weekly",
                                    textColor: AppColors.yellow,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ReuseableTextWidget(
                                    text: "Challenge",
                                    textColor: AppColors.yellow,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 8),
                                  ReuseableTextWidget(
                                    text: "Plank With Hip Twist",
                                    textColor: AppColors.white,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/home/homea.png',
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              const ReuseableTextWidget(text: "Articles & Tips",
              textColor: AppColors.yellow,
              fontSize: 16,
              fontFamily:"Poppins",
              ),
              const SizedBox(height: 10,),
              Row(
          children: List.generate(images.length, (index) {
            return Row(
                    children: [
          ArticleItem(
            imagePath: images[index],
            title: title[index],
          ),
          if (index < images.length - 1) 
            const SizedBox(width: 20), 
                    ],
            );
          }),
                    ),
                    
            ],
          ),
        ),
      ),
    );
  }
}
