import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/Notification_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 



class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReuseableTextWidget(
          text: "Notifications Settings",
          textColor: AppColors.darkpurple,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow)),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<NotificationSettingProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              _buildSwitchTile(
                title: 'General Notification',
                value: provider.generalNotification,
                onChanged: (value) {
                  provider.toggleGeneralNotification(value);
                },
              ),
              _buildSwitchTile(
                title: 'Sound',
                value: provider.sound,
                onChanged: (value) {
                  provider.toggleSound(value);
                },
              ),
              _buildSwitchTile(
                title: "Don't Disturb Mode",
                value: provider.dontDisturbMode,
                onChanged: (value) {
                  provider.toggleDontDisturbMode(value);
                },
              ),
              _buildSwitchTile(
                title: 'Vibrate',
                value: provider.vibrate,
                onChanged: (value) {
                  provider.toggleVibrate(value);
                },
              ),
              _buildSwitchTile(
                title: 'Lock Screen',
                value: provider.lockScreen,
                onChanged: (value) {
                  provider.toggleLockScreen(value);
                },
              ),
              _buildSwitchTile(
                title: 'Reminders',
                value: provider.reminders,
                onChanged: (value) {
                  provider.toggleReminders(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.yellow,
          inactiveTrackColor: AppColors.purple,
        ),
      ),
    );
  }
}
