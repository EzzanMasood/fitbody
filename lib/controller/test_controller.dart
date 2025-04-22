import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestController {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();
  final FirebaseAuth auth =FirebaseAuth.instance;
 Future <UserCredential?>login (BuildContext context, String email, String password)async{ 
  try {
    UserCredential userCredential =await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }on FirebaseAuthException catch (e){
    String errorMessage="Incorrect password";
    if (e.code == 'user-not-found') {
        errorMessage = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      }
       _showSnackBar(context, errorMessage);
      return null;
  }

 }
   Future<UserCredential?> createUser(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Something went wrong. Please try again.";

      if (e.code == 'email-already-in-use') {
        errorMessage = "This email is already registered.";
      } 

      _showSnackBar(context, errorMessage);
      return null;
    }
  }
   void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

}