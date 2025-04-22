import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:flutter/material.dart';

class ReminderNotificationScreen extends StatefulWidget {
  const ReminderNotificationScreen({super.key});

  @override
  State<ReminderNotificationScreen> createState() =>
      _ReminderNotificationScreenState();
}

class _ReminderNotificationScreenState
    extends State<ReminderNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReuseableTextWidget(
                  text: "Today",
                  textColor: AppColors.yellow,
                  fontSize: 16,
                ),
                _notificationCard(
                  title: "New workout is Available",
                  time: "June 10 - 10:00 AM",
                  icon: Icons.star,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "Don’t forget to drink water",
                  time: "June 10 - 8:00 AM",
                  icon: Icons.lightbulb,
                  avatarColor: AppColors.yellow,
                  iconColor: AppColors.black,
                ),
                const SizedBox(height: 30),
                const ReuseableTextWidget(
                  text: "Yesterday",
                  textColor: AppColors.yellow,
                  fontSize: 16,
                ),
                _notificationCard(
                  title: "Upper Body Workout Completed!",
                  time: "June 09 - 6:00 PM",
                  icon: Icons.check_circle,
                  avatarColor: AppColors.yellow,
                  iconColor: AppColors.black,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "Remember Your Exercise Session",
                  time: "June 09 - 3:00 PM",
                  icon: Icons.lightbulb,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "New Article & Tip posted!",
                  time: "June 09 - 3:00 PM",
                  icon: Icons.article,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 30),
                const ReuseableTextWidget(
                  text: "May 29 - 20XX",
                  textColor: AppColors.yellow,
                  fontSize: 16,
                ),
                _notificationCard(
                  title: "You started a new challenge!",
                  time: "May 29 - 9:00 AM",
                  icon: Icons.star,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "New House training ideas!",
                  time: "May 29 - 9:00 AM",
                  icon: Icons.star,
                  avatarColor: AppColors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationCard({
    required String title,
    required String time,
    required IconData icon,
    required Color avatarColor,
    Color? iconColor,
  }) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              child: Icon(icon, color: iconColor ?? AppColors.white),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableTextWidget(
                  text: title,
                  textColor: AppColors.black,
                ),
                ReuseableTextWidget(
                  text: time,
                  textColor: AppColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
