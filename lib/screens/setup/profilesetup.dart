import 'dart:io';

import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/homescreens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetUpScreen extends StatefulWidget {
  const ProfileSetUpScreen({super.key});

  @override
  State<ProfileSetUpScreen> createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: const ReuseableTextWidget(
          text: "Back",
          textColor: AppColors.yellow,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: AppColors.yellow,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const Center(
            child: ReuseableTextWidget(
              text: "Fill Your Profile",
              fontSize: 24,
              textColor: AppColors.white,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 20),
          const ReuseableTextWidget(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const ReuseableTextWidget(
            text: "sed do eiusmod tempor incididunt ut labore et dolore",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const ReuseableTextWidget(
            text: "magna aliqua",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const SizedBox(height: 20),
          Container(
            height: 100,
            width: double.infinity,
            color: AppColors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _profileImage != null
                        ? Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: FileImage(_profileImage!))),
                          )
                        :  CircleAvatar(
                        radius: 30,
                        ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage, 
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: const BoxDecoration(
                            color: AppColors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                MyTextField(
                  hintText: "Madison Smith",
                  labelText: "Full name",
                  labelTextColor: AppColors.purple,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Madison",
                  labelText: "Nickname",
                  labelTextColor: AppColors.purple,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "madison@gmail.com",
                  labelText: "Email",
                  labelTextColor: AppColors.purple,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "+123 456 78910",
                  labelText: "Mobile Number",
                  labelTextColor: AppColors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(30),
            height: 50,
            width: 150,
            child: const ReuseableTextWidget(
              text: "Start",
              textColor: AppColors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
