import 'package:flutter/material.dart';

class PhysicalActivityProvider extends ChangeNotifier {
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;

  bool get isSelected1 => _isSelected1;
  bool get isSelected2 => _isSelected2;
  bool get isSelected3 => _isSelected3;

  
  void setSelected(int index) {
    
    if (index == 1) {
      _isSelected1 = true;
      _isSelected2 = false;
      _isSelected3 = false;
    } else if (index == 2) {
      _isSelected1 = false;
      _isSelected2 = true;
      _isSelected3 = false;
    } else if (index == 3) {
      _isSelected1 = false;
      _isSelected2 = false;
      _isSelected3 = true;
    }
    notifyListeners();
  }
}
