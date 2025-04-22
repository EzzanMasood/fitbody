import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/homescreens/homescreen.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

class AvocadoToastScreen extends StatefulWidget {
  const AvocadoToastScreen({super.key});

  @override
  State<AvocadoToastScreen> createState() => _AvocadoToastScreenState();
}

class _AvocadoToastScreenState extends State<AvocadoToastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          "Meal Plans",
          style: TextStyle(
            color: AppColors.darkpurple,
            fontWeight: FontWeight.bold,
          ),
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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Avocado And Egg Toast",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ),
            const SizedBox(height: 5),

  
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                children: const [
                  Icon(Icons.access_time, size: 16, color: AppColors.purple),
                  SizedBox(width: 4),
                  Text(
                    "15 Minutes",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.local_fire_department, size: 16, color: AppColors.purple),
                  SizedBox(width: 4),
                  Text(
                    "150 Cal",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

    
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.purple,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/mealideas/imgseven.png", 
                                fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

          
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: const Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const BulletPointText(text: "Wholemeal bread"),
            const BulletPointText(text: "Ripe avocado slices"),
            const BulletPointText(text: "Fried or poached egg"),
            const SizedBox(height: 20),

            /// **Preparation Section**
            Padding(
             padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: const Text(
                "Preparation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: const Text(
                "Sed earum sequi est magnam doloremque aut porro dolores sit "
                "molestiae fuga. Et rerum inventore ut perspiciatis dolorem "
                "sed internos porro aut labore dolorem At quia reiciendis in "
                "consequuntur possimus.",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            SizedBox(height: 20,),
               Center(
              child: CustomButton(
                onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));          
                },
                color: AppColors.yellow,
                height: 50,
                width: 160,
                borderRadius: BorderRadius.circular(30),
                child: Center(
                  child: ReuseableTextWidget(
                    text: "Save Recipe",
                    textColor: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class BulletPointText extends StatelessWidget {
  final String text;
  const BulletPointText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}