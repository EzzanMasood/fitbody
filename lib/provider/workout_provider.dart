import 'package:flutter/material.dart';

class WorkoutProvider extends ChangeNotifier {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;

  void isSelected(int index) {
    if (index == 1) {
      isSelected1 = true;
      isSelected2 = false;
      isSelected3 = false;
    } else if (index == 2) {
      isSelected1 = false;
      isSelected2 = true;
      isSelected3 = false;
    } else if (index == 3) {
      isSelected1 = false;
      isSelected2 = false;
      isSelected3 = true;
    }
    notifyListeners(); 
  }
}
