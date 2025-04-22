import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/controller/auth_controller.dart';
import 'package:fitbody/screens/auth/fetch_data.dart';
import 'package:fitbody/screens/homescreens/homescreen.dart';
import 'package:fitbody/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/auth/forgetton_password.dart';
import 'package:fitbody/screens/auth/signup.dart';
import 'package:flutter/widgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isLoading = false;
  AuthController _authController = AuthController();
  bool isVisible = true;
  @override

  Future authWithGoogle({required BuildContext context}) async {
    try {
      await _authController.signInWithGoogle(context: context);
    } catch (e) {
      if (!context.mounted) {
        return ToastUtils.showToast(message: "An error occurred");
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const ReuseableTextWidget(
          text: "Log In",
          textColor: AppColors.yellow,
          fontFamily: "Poopins",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ReuseableTextWidget(
            text: "Welcome",
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
            height: 250,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextField(
                    controller: _authController.emailController,
                    hintText: "Enter your email",
                    hintTextColor: Colors.grey,
                    labelText: "Username or email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: _authController.passController,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(isVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    hintText: "Enter your Password",
                    hintTextColor: Colors.grey,
                    obscureText: isVisible,
                    labelText: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgettonPassword()));
                        },
                        child: const ReuseableTextWidget(
                          text: "Forgot Password ?",
                          textColor: AppColors.black,
                          fontSize: 12,
                        ),
                      )
                    ],
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
    String email = _authController.emailController.text.trim();
    String password = _authController.passController.text.trim();

    if (email.isEmpty) {
      ToastUtils.showToast(message: "Please Enter the email");
      return;
    }
    if (password.isEmpty) {
      ToastUtils.showToast(message: "Please Enter the password");
      return;
    }

    setState(() {
      isLoading = true; 
    });

    try {
      UserCredential? userCredential = await _authController.login(context, email, password);

      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      ToastUtils.showToast(message: "Login Failed: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; 
        });
      }
    }
  },
  border: Border.all(color: AppColors.white),
  color: AppColors.button,
  borderRadius: BorderRadius.circular(30),
  height: 50,
  width: 150,
  child: isLoading
      ? const CircularProgressIndicator(color: AppColors.white)
      : const ReuseableTextWidget(
          text: "Log In",
          textColor: AppColors.white,
          fontFamily: "Poopins",
        ),
),


          const SizedBox(
            height: 20,
          ),
          const ReuseableTextWidget(
            text: "or sign up with",
            fontSize: 12,
            textColor: AppColors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  onTap: () => authWithGoogle(context: context),
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  color: AppColors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.google,
                    color: AppColors.purple,
                    size: 20,
                  )),
              const SizedBox(
                width: 15,
              ),
              CustomButton(
                  onTap: () {},
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  color: AppColors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: AppColors.purple,
                    size: 20,
                  )),
              const SizedBox(
                width: 15,
              ),
              CustomButton(
                  onTap: () {},
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  color: AppColors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.fingerprint,
                    color: AppColors.purple,
                    size: 20,
                  )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ReuseableTextWidget(
                text: "Don't have an account ? ",
                textColor: AppColors.white,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const ReuseableTextWidget(
                  text: "Sign Up",
                  textColor: AppColors.yellow,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
