import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/profilescreens/notificationsettingscreen.dart';
import 'package:fitbody/screens/profilescreens/passwordsettings.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const ReuseableTextWidget(
          text: "Settings",
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
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          _buildListTile(
            icon: Icons.notifications,
            title: 'Notification Setting',
            onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationSettingScreen()));
            },
          ),
          _buildListTile(
            icon: Icons.lock,
            title: 'Password Setting',
            onTap: () {
   Navigator.push(context, MaterialPageRoute(builder: (context)=>const PasswordSettingsScreen()));           
            },
          ),
          _buildListTile(
            icon: Icons.delete,
            title: 'Delete Account',
            onTap: () {
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.purple, 
        child: Icon(icon, color: Colors.white), 
      ),
      title: Text(title, style: const TextStyle(color: AppColors.white,fontFamily: "Poppins")),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_drop_down, color: AppColors.yellow),
    );
  }
}

