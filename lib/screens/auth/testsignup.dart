import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/controller/test_controller.dart';
import 'package:fitbody/screens/auth/testlogin.dart';
import 'package:flutter/material.dart';

class TestSignUp extends StatefulWidget {
  const TestSignUp({super.key});

  @override
  State<TestSignUp> createState() => _TestSignUpState();
}

class _TestSignUpState extends State<TestSignUp> {
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
                   MyTextField(
          controller: _testController.confirmPasswordController,          
                    hintText: "Re-Enter your password",
                    hintTextColor: Colors.grey,
                    labelText: "Confirm Password",
                  ),
                   SizedBox(height: 10,),
                    CustomButton(    onTap: () async {
              
               
                String email = _testController.emailController.text.trim();
                String password = _testController.passController.text.trim();
                String confirmPassword = _testController.confirmPasswordController.text.trim();
                if ( email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                  _showSnackBar(context, "Please fill all fields.");
                  return;
                }
                if (password != confirmPassword) {
                  _showSnackBar(context, "Passwords do not match.");
                  return;
                }
                var userCredential = await _testController.createUser(context, email, password);
                if (userCredential != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestLogin()),
                  );
                }
              },          
                    
                     height: 40,
                  width: 180,
                    color: Colors.greenAccent,
                   child:Text("Sign Up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
        ],
      ),

    );
  }
    void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}