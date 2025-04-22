import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/controller/auth_controller.dart';
import 'package:fitbody/screens/auth/login.dart';
import 'package:fitbody/screens/profilescreens/editscreene.dart';
import 'package:fitbody/screens/profilescreens/favorite.dart';
import 'package:fitbody/screens/profilescreens/help&faq.dart';
import 'package:fitbody/screens/profilescreens/settingsscreen.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 245,
                width: double.infinity,
                color: AppColors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/profile/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      'Madison Smith',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      'madisons@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      'Birthday: April 1st',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      _buildMenuItem(
                        icon: Icons.person,
                        text: 'Profile',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditScreen()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.star,
                        text: 'Favorite',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FavoriteScreen()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.lock,
                        text: 'Privacy Policy',
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.settings,
                        text: 'Settings',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingScreen()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.help_outline,
                        text: 'Help',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HelpFaqScreen()));
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.logout,
                        text: 'Logout',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            useRootNavigator: true,
                            builder: (context) {
                              return Container(
                                height: 150,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: AppColors.darkpurple,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const ReuseableTextWidget(
                                      text: "Are you sure you want to",
                                      textColor: AppColors.black,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const ReuseableTextWidget(
                                      text: "log out ?",
                                      textColor: AppColors.black,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                            width: 140,
                                            height: 40,
                                            onTap: () {},
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const ReuseableTextWidget(
                                              text: "Cancel",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              textColor: AppColors.purple,
                                              fontFamily: "Poopins",
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CustomButton(
                                            width: 140,
                                            height: 40,
                                            onTap: () {
                                              AuthController().logout(context);
                                             
                                            },
                                            color: AppColors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const ReuseableTextWidget(
                                              text: "Yes, logout ",
                                              textColor: AppColors.black,
                                              fontFamily: "Poopins",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 210,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.darkpurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatsItemWithDivider('75 Kg', 'Weight'),
                  _buildStatsItemWithDivider('28', 'Years Old'),
                  _buildStatsItem('1.65 CM', 'Height'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsItemWithDivider(String value, String label) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Container(
          height: 30,
          width: 1,
          color: Colors.white70,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ],
    );
  }

  Widget _buildStatsItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.purple,
              radius: 16,
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.yellow,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
