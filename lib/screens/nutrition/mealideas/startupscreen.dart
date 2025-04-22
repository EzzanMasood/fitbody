import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/nutrition/mealideas/mealideasscrrena.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationScreen()),
                  );
                },
                icon: const Icon(Icons.notifications, color: Colors.white),
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProfileScreen()),
                  );
                },
                icon: const Icon(Icons.person, color: Colors.white),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
        
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mealideas/imgfour.png"), 
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
                height: 150,
                color: AppColors.purple,
                child: Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/onboarding/onboardinglogoc.png"),
                          SizedBox(width: 10,),
                          ReuseableTextWidget(text: "Meal ideas",
                          textColor: AppColors.white,
                          fontSize: 20,)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ReuseableTextWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing\n elit, sed do eiusmod tempor incididunt ut labore.",textColor: AppColors.white,)
                  ],
                ),
               ),
               SizedBox(height: 20,),
              CustomButton(
                        onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MealIdeasScreen())) ;       
                        },
                        color: AppColors.button,
                    
                        height: 50,
                        width: 180,
                        borderRadius: BorderRadius.circular(30),
                        child: Center(
                          child: const Text(
                            "Discover",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
