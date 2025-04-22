import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/nutrition/mealplans/loadingscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';

class CaloricGoalScreen extends StatefulWidget {
  const CaloricGoalScreen({super.key});

  @override
  State<CaloricGoalScreen> createState() => _CaloricGoalScreenState();
}

class _CaloricGoalScreenState extends State<CaloricGoalScreen> {
  String? selectedDietaryPreference;
  String? selectedAllergy;
  String? selectedMealType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const ReuseableTextWidget(
          text: "Meal Plans",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Caloric Goal"),
              _buildSubtitle("What is your daily caloric intake goal?"),
              _buildGridRadioGroup(
                options: ["Less than 1500 calories","1500-2000 calories","More than 2000 calories","Not sure/Don't have a goal"],
                selectedValue: selectedDietaryPreference,
                onChanged: (value) {
                  setState(() {
                    selectedDietaryPreference = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Cooking Time Preference"),
              _buildSubtitle("How much time are you willing to spend cooking each meal?"),
              _buildGridRadioGroup(
                options: ["Nuts", "Eggs", "Dairy", "No allergies", "Shellfish"],
                selectedValue: selectedAllergy,
                onChanged: (value) {
                  setState(() {
                    selectedAllergy = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Number of Servings"),
              _buildSubtitle("How many servings do you need per meal?"),
              _buildGridRadioGroup(
                options: ["1","2","3-4","More than 4"],
                selectedValue: selectedMealType,
                onChanged: (value) {
                  setState(() {
                    selectedMealType = value;
                  });
                },
              ),
              SizedBox(height: 10,),
             Center(
  child: CustomButton(
    onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));    
    },
    color: AppColors.yellow,
    height: 40,
    width: 140,
    borderRadius: BorderRadius.circular(30),
    child: Center(
      child: Align(
        alignment: Alignment.center,
        child: ReuseableTextWidget(
          text: "Create",
          textColor: AppColors.black,
        ),
      ),
    ),
  ),
)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.yellow,
        ),
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  Widget _buildGridRadioGroup({
    required List<String> options,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 4, 
        mainAxisSpacing: 7,
        childAspectRatio: 4, 
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return RadioListTile<String>(
          title: Text(
            options[index],
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          value: options[index],
          groupValue: selectedValue,
          onChanged: onChanged,
          activeColor: AppColors.purple,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}
