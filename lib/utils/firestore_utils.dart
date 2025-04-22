import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/screens/homescreens/homescreen.dart';
import 'package:fitbody/screens/onboardingscreens/onboardingscreenb.dart';
import 'package:get/get.dart';

class FireStoreUtils {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static Future<bool> isLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    User? user = _auth.currentUser;

    if (user != null) {
      return await userExistOrNot(user.uid);
    }
    return false;
  }

  static Future<bool> userExistOrNot(String uid) async {
    try {
      DocumentSnapshot userDoc = await _fireStore.collection('Users').doc(uid).get();
      return userDoc.exists;
    } catch (error) {
      print("Failed to check if user exists: $error");
      return false;
    }
  }
    void redirectScreen() async {
    bool isLogin = await FireStoreUtils.isLogin();
    if (isLogin) {
      Get.offAll(() => const HomeScreen()); 
    } else {
      Get.offAll(() => const OnBoardingScreena()); 
    }
  }
}
