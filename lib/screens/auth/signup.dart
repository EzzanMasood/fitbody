import 'package:fitbody/config/styles.dart';
import 'package:fitbody/controller/auth_controller.dart';
import 'package:fitbody/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/screens/auth/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  void _registerUser(BuildContext context) async {
  String name = _authController.nameController.text.trim();
  String email = _authController.emailController.text.trim();
  String password = _authController.passController.text.trim();
  String confirmPassword = _authController.confirmPasswordController.text.trim();

  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (name.isEmpty) {
    ToastUtils.showToast(message: "Please Enter the Name");
    return;
  }
  if (email.isEmpty) {
    ToastUtils.showToast(message: "Please Enter the Email");
    return;
  }
  if (!emailValid) {
    ToastUtils.showToast(message: "Please Enter a valid Email");
    return;
  }
  if (password.isEmpty) {
    ToastUtils.showToast(message: "Please Enter the Password");
    return;
  }
  if (confirmPassword.isEmpty) {
    ToastUtils.showToast(message: "Please Confirm the Password");
    return;
  }
  if (password != confirmPassword) {
    ToastUtils.showToast(message: "Password does not match");
    return;
  }
  setState(() {
    isLoading = true;
  });

  try {
    var userCredential =
        await _authController.createUser(context, email, password,name);
    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    }
  } catch (e) {
    ToastUtils.showToast(message:"Registration failed: ${e.toString()}");
  } finally {
    setState(() {
      isLoading = false; 
    });
  }
}

  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const ReuseableTextWidget(
          text: "Create Account",
          textColor: AppColors.yellow,
          fontFamily: "Poopins",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: AppColors.yellow,
          iconSize: 25.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ReuseableTextWidget(
              text: "Let's Start",
              textColor: AppColors.white,
              fontFamily: "Poopins",
              fontSize: 16,
            ),
            const SizedBox(height: 30),
            Container(
              color: AppColors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextField(
                    controller: _authController.nameController,
                    hintText: "Enter your name",
                    labelText: "Full Name",
                    hintTextColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _authController.emailController,
                    hintText: "Enter your email",
                    labelText: "Email or Mobile Number",
                    hintTextColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _authController.passController,
                    hintText: "Enter your Password",
                    labelText: "Password",
                    hintTextColor: Colors.grey,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _authController.confirmPasswordController,
                    hintText: "Enter your Password Again",
                    labelText: "Re-Enter Password",
                    hintTextColor: Colors.grey,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 50.0,
                  )
                : CustomButton(
                    onTap: () => _registerUser(context),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.button,
                    borderRadius: BorderRadius.circular(30),
                    height: 50,
                    width: 150,
                    child: const ReuseableTextWidget(
                      text: "Sign Up",
                      textColor: AppColors.white,
                      fontFamily: "Poopins",
                    ),
                  ),
            const SizedBox(height: 20),
            const ReuseableTextWidget(
              text: "or sign up with",
              fontSize: 12,
              textColor: AppColors.white,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {},
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  color: AppColors.white,
                  child: const FaIcon(FontAwesomeIcons.google,
                      color: AppColors.purple, size: 20),
                ),
                const SizedBox(width: 15),
                CustomButton(
                  onTap: () {},
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  color: AppColors.white,
                  child: const FaIcon(FontAwesomeIcons.facebook,
                      color: AppColors.purple, size: 20),
                ),
                const SizedBox(width: 15),
                CustomButton(
                  onTap: () {},
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  color: AppColors.white,
                  child: const FaIcon(FontAwesomeIcons.fingerprint,
                      color: AppColors.purple, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ReuseableTextWidget(
                  text: "Already have an account? ",
                  textColor: AppColors.white,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LogIn()));
                  },
                  child: const ReuseableTextWidget(
                    text: "Log in",
                    textColor: AppColors.yellow,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
