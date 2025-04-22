import 'package:flutter/material.dart';

class GenderSelectionProvider extends ChangeNotifier {
  bool _isSelected1 = false;
  bool _isSelected2 = false;

  bool get isSelected1 => _isSelected1;
  bool get isSelected2 => _isSelected2;

  isSelected(int index) {
    if (index == 1) {
      _isSelected1 = true;
      _isSelected2 = false;
    } else if (index == 2) {
      _isSelected1 = false;
      _isSelected2 = true;
    }
    notifyListeners();
  }
}
