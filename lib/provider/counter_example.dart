import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterExampleProvider extends ChangeNotifier {
  int _num = 0;
  int get num => _num;

  increament() {
    _num++;
    print(num);
    notifyListeners();
  }
}

class CounterExampleGet extends GetxController {
  var num = 0.obs;
  increament() {
    num.value++;
  }
}
