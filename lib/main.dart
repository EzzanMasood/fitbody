import 'package:firebase_core/firebase_core.dart';
import 'package:fitbody/firebase_options.dart';
import 'package:fitbody/provider/Notification_setting_provider.dart';
import 'package:fitbody/provider/counter_example.dart';
import 'package:fitbody/provider/gender_selection_provider.dart';
import 'package:fitbody/provider/goal_selection_provider.dart';
import 'package:fitbody/provider/helpfaq_provider.dart';
import 'package:fitbody/provider/mealideas_provider.dart';
import 'package:fitbody/provider/notification_provider.dart';
import 'package:fitbody/provider/nutrition_provider.dart';
import 'package:fitbody/provider/password_setting_provider.dart';
import 'package:fitbody/provider/physical_activity_provider.dart';
import 'package:fitbody/provider/progress_tracking_provider.dart';
import 'package:fitbody/provider/search_provider.dart';
import 'package:fitbody/provider/workout_provider.dart';
import 'package:fitbody/screens/auth/fetch_data.dart';
import 'package:fitbody/screens/auth/login.dart';
import 'package:fitbody/screens/nutrition/nutritionscreen.dart';
import 'package:fitbody/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GenderSelectionProvider(),
        ),
        ChangeNotifierProvider(create: (context) => GoalSelectionProvider()),
        ChangeNotifierProvider(create: (context) => PhysicalActivityProvider()),
        ChangeNotifierProvider(create: (context) => NotificationSettingProvider()),
        ChangeNotifierProvider(create: (context) => PasswordSettingProvider()),
        ChangeNotifierProvider(create: (context) => HelpFaqProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutProvider()),
        ChangeNotifierProvider(create: (context) => ProgressTrackingProvider()),
        ChangeNotifierProvider(create: (context) => NutritionProvider()),
        ChangeNotifierProvider(create: (context) => MealideasProvider()),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FetchData(),
      ),
    );
  }
}


class LoadingProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}

