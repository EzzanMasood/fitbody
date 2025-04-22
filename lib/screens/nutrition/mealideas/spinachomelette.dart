import 'package:fitbody/config/colors.dart';
import 'package:fitbody/provider/mealideas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpinachOmelette extends StatefulWidget {
  const SpinachOmelette({super.key});

  @override
  State<SpinachOmelette> createState() => _SpinachOmeletteState();
}

class _SpinachOmeletteState extends State<SpinachOmelette> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: AppColors.backgroundColor,
     
 body: Consumer<MealideasProvider>(builder: (context,provider,child){
  return Column(
    children: [
      
                  SizedBox(height: 10,),
           Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Spinach and Tomato\n Omelette",
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
                    "assets/images/mealideas/imgsix.png", 
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
            const BulletPointText(text: "2-3 eggs"),
            const BulletPointText(text: "A handfull of fresh spinch"),
            const BulletPointText(text: "1 small tomato"),
            const BulletPointText(text: "Salt and pepper to taste"),
            const BulletPointText(text: "Olieve oil or butter"),
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
    ],
  );
 }),
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