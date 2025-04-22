import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/models/user_models.dart';
import 'package:fitbody/screens/auth/login.dart';
import 'package:fitbody/screens/homescreens/homescreen.dart';
import 'package:fitbody/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseFirestore cloudFirestore = FirebaseFirestore.instance;

  static String getCurrentUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<UserCredential?> login(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      
      if (!userCredential.user!.emailVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please verify your email before logging in.')),
        );
        await userCredential.user!.sendEmailVerification(); // Resend verification email
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Incorrect Password";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      }

      ToastUtils.showToast(message: errorMessage);
      return null;
    }
  }

  Future<UserCredential?> createUser(BuildContext context, String email, String password, String name) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
      );
      await saveData(userModel);

      await userCredential.user!.sendEmailVerification();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Something went wrong. Please try again.";
      
      if (e.code == 'email-already-in-use') {
        errorMessage = "This email is already registered.";
      } else if (e.code == 'weak-password') {
        errorMessage = "Password is too weak.";
      }
      
      ToastUtils.showToast(message: errorMessage);
      return null;
    }
  }

  Future<void> logout(BuildContext context) async {
    await auth.signOut();
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LogIn()),
    );
  }

  Future<void> saveData(UserModel userModel) async {
    try {
      await cloudFirestore.collection('Users').doc(userModel.id).set(userModel.toJson());
      ToastUtils.showToast(message: "Data Inserted");
    } catch (e) {
      ToastUtils.showToast(message: "Error inserting data: ${e.toString()}");
    }
  }



  ///Google auth Instance


  /// Firebase FireStorage instance
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

  /// Authentication wth Google

  Future signInWithGoogle({required BuildContext context}) async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("Google sign-in process canceled");
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);
      await _sendingGoogleUserData(userCredential.user!);

      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print("Error signing in with Google: $e");

      return;
    }
  }

  ///  Sending data to Firebase Firestore with Google Auth

  Future<void> _sendingGoogleUserData(User user) async {
    final userData = await _usersCollection.doc(user.uid).get();

    if (!userData.exists) {
      // User doesn't exist in Firestore, add user data
      await _usersCollection.doc(user.uid).set({
        'name': user.displayName,
        'email': user.email,
        'userId': user.uid,
        'userPicture': user.photoURL,
        'createdAt': DateTime.now(),
      });
    } else {
      // User already exists, update user data if necessary
      Map<String, dynamic> updatedData = {};

      if (user.displayName != userData['name']) {
        updatedData['name'] = user.displayName;
      }
      if (user.email != userData['email']) {
        updatedData['email'] = user.email;
      }
      if (user.photoURL != userData['userPicture']) {
        updatedData['userPicture'] = user.photoURL;
      }

      if (updatedData.isNotEmpty) {
        await _usersCollection.doc(user.uid).update(updatedData);
      }
    }
  }



 
  // /// Loading animation
  // void _showLoadingDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return Center(
  //         child: LoadingAnimationWidget.hexagonDots(
  //           color: Colors.white,
  //           size: 50,
  //         ),
  //       );
  //     },
  //   );
  // }

  // /// Dismiss Loading Animation
  // void _dismissLoadingDialog(BuildContext context) {
  //   Navigator.pop(context);
  // }
Future<void> resetPassword(BuildContext context, String email) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password reset email sent! Check your inbox.')),
    );
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
  }
}

}

