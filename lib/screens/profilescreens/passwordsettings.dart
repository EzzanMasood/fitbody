import 'package:fitbody/provider/password_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/auth/forgetton_password.dart';

class PasswordSettingsScreen extends StatelessWidget {
  const PasswordSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const ReuseableTextWidget(
          text: "Password Settings",
          textColor: AppColors.darkpurple,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Consumer<PasswordSettingProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                const SizedBox(height: 20),
                MyTextField(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      provider.toggleIsVisible1();
                    },
                    child: Icon(
                      provider.isVisible1
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkpurple,
                    ),
                  ),
                  hintText: "Enter your current Password",
                  obscureText: !provider.isVisible1,
                  labelText: "Current Password",
                  hintTextColor: Colors.grey,
                  labelTextColor: AppColors.darkpurple,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgettonPassword(),
                          ),
                        );
                      },
                      child: const ReuseableTextWidget(
                        text: "Forgot Password?",
                        textColor: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                MyTextField(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      provider.toggleIsVisible2();
                    },
                    child: Icon(
                      provider.isVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkpurple,
                    ),
                  ),
                  hintText: "Enter your new Password",
                  obscureText: !provider.isVisible2,
                  labelText: "New Password",
                  labelTextColor: AppColors.darkpurple,
                  hintTextColor: Colors.grey,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      provider.toggleIsVisible3();
                    },
                    child: Icon(
                      provider.isVisible3
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkpurple,
                    ),
                  ),
                  hintText: "Re_Enter your new Password",
                  obscureText: !provider.isVisible3,
                  labelText: "Confirm new Password",
                  labelTextColor: AppColors.darkpurple,
                  hintTextColor: Colors.grey,
                ),
                const SizedBox(height: 100),
                CustomButton(
                  onTap: () {},
                  height: 50,
                  width: 200,
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(30),
                  child: const ReuseableTextWidget(
                    text: "Change Password",
                    textColor: AppColors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
