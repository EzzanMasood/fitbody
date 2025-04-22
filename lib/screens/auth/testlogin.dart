import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/controller/test_controller.dart';
import 'package:fitbody/screens/auth/testsignup.dart';
import 'package:fitbody/screens/setup/setup.dart';
import 'package:flutter/material.dart';

class TestLogin extends StatefulWidget {
  const TestLogin({super.key});

  @override
  State<TestLogin> createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  TestController _testController=TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(
            controller: _testController.emailController,
                    hintText: "Enter your email",
                    hintTextColor: Colors.grey,
                    labelText: "Username or email",
                  ),
                  SizedBox(height: 10,),
                   MyTextField(
            controller: _testController.passController,
                    hintText: "Enter your password",
                    hintTextColor: Colors.grey,
                    labelText: "Password",
                  ),
                  SizedBox(height: 10,),
                  CustomButton(onTap: ()
                  async{
          String email=_testController.emailController.text.trim();
          String password=_testController.passController.text.trim();
          if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter email and password"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }
     UserCredential? userCredential = await _testController.login(context, email, password);

    if (userCredential != null) {
  
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SetUpScreen()),
      );
    }
  
                  },
                  height: 40,
                  width: 180,
                  color: Colors.greenAccent,
                   child:Text("Log In",
                   style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                   SizedBox(height: 10,),
                    CustomButton(onTap: (){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>TestSignUp()));
                    },
                     height: 40,
                  width: 180,
                    color: Colors.greenAccent,
                   child:Text("Sign Up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
        ],
      ),

    );
  }
}