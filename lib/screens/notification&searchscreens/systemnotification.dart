import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:flutter/material.dart';

class SystemNotificationScreen extends StatefulWidget {
  const SystemNotificationScreen({super.key});

  @override
  State<SystemNotificationScreen> createState() =>
      _SystemNotificationScreenState();
}

class _SystemNotificationScreenState extends State<SystemNotificationScreen> {
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
                  title: "You have a new message! ",
                  time: "June 10 - 2:00 pM",
                  icon: Icons.star,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "scheduled maintenance.",
                  time: "June 10 - 2:00 pM",
                  icon: Icons.lightbulb,
                  avatarColor: AppColors.yellow,
                  iconColor: AppColors.black,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "We've detected a login\n  from a new device",
                  time: "June 10 - 2:00 pM",
                  icon: Icons.check_circle,
                  avatarColor: AppColors.yellow,
                  iconColor: AppColors.black,
                ),
                const SizedBox(height: 30),
                const ReuseableTextWidget(
                  text: "Yesterday",
                  textColor: AppColors.yellow,
                  fontSize: 16,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "We've updated our privacy policy",
                  time: "June 09 - 1:00 pM",
                  icon: Icons.lightbulb,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "You have a new message!",
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
                  title: "You have a new message!",
                  time: "May 29 - 20XX",
                  icon: Icons.star,
                  avatarColor: AppColors.purple,
                ),
                const SizedBox(height: 10),
                _notificationCard(
                  title: "We've made changes to our\n terms of service",
                  time: "May 29 - 20XX",
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
