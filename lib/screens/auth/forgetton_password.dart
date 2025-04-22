import 'package:fitbody/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/auth/set_password.dart';
import 'package:get/get.dart';

class ForgettonPassword extends StatefulWidget {
  const ForgettonPassword({super.key});

  @override
  State<ForgettonPassword> createState() => _ForgettonPasswordState();
}

class _ForgettonPasswordState extends State<ForgettonPassword> {
     final TextEditingController forgotemailController = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const ReuseableTextWidget(
          text: "Forgetton Password",
          textColor: AppColors.yellow,
          fontFamily: "Poopins",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: AppColors.yellow,
          iconSize: 25.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ReuseableTextWidget(
            text: "Forgot Password",
            textColor: AppColors.white,
            fontFamily: "Poopins",
            fontSize: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: ReuseableTextWidget(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
              textColor: AppColors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: AppColors.purple,
            height: 150,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextField(
                    hintText: "Enter your email",
                    labelText: "Enter your email address",
                    controller: forgotemailController,
                    hintTextColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });

                await AuthController().resetPassword(
                  context,
                  forgotemailController.text.toString().trim(),
                );

                setState(() {
                  _isLoading = false;
                });
              },
              border: Border.all(color: AppColors.white),
              color: AppColors.button,
              borderRadius: BorderRadius.circular(30),
              height: 50,
              width: 150,
              child: const ReuseableTextWidget(
                text: "Continue",
                textColor: AppColors.white,
                fontFamily: "Poopins",
              )),
        ],
      ),
    );
  }
}
