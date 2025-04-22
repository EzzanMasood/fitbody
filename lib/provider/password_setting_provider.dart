import 'package:flutter/material.dart';

class PasswordSettingProvider extends ChangeNotifier {
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;

  void toggleIsVisible1() {
    isVisible1 = !isVisible1;
    notifyListeners();
  }

  void toggleIsVisible2() {
    isVisible2 = !isVisible2;
    notifyListeners();
  }

  void toggleIsVisible3() {
    isVisible3 = !isVisible3;
    notifyListeners();
  }
}