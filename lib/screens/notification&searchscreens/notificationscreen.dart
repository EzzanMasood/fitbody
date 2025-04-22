import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/notification_provider.dart';
import 'package:fitbody/screens/notification&searchscreens/remindersnotification.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/systemnotification.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationProvider(),
      child: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              titleSpacing: 0,
              title: const ReuseableTextWidget(
                text: "Notifications",
                textColor: AppColors.darkpurple,
                fontWeight: FontWeight.bold,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow),
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
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(1),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: provider.isSelected1
                                  ? AppColors.yellow
                                  : AppColors.white,
                            ),
                            child: Center(
                              child: ReuseableTextWidget(
                                text: "Reminders",
                                textColor: provider.isSelected1
                                    ? AppColors.black
                                    : AppColors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(2),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: provider.isSelected2
                                  ? AppColors.yellow
                                  : AppColors.white,
                            ),
                            child: Center(
                              child: ReuseableTextWidget(
                                text: "System",
                                textColor: provider.isSelected2
                                    ? AppColors.black
                                    : AppColors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (provider.isSelected1)
                     SizedBox(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: ReminderNotificationScreen(),
                    ),
                  if (provider.isSelected2)
                     SizedBox(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: SystemNotificationScreen(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
