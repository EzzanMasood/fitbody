import 'package:flutter/material.dart';

class ProgressTrackingProvider extends ChangeNotifier{
  bool isSelected1=true;
  bool isSelected2=false;
  void isSelected(int index){
    if(index==1){
      isSelected1=true;
      isSelected2=false;
    }
    else if(index==2){
      isSelected1=false;
      isSelected2=true;
    }
    notifyListeners();
  } 
}