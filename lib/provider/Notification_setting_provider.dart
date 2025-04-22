import 'package:flutter/material.dart';

class NotificationSettingProvider extends ChangeNotifier {
  bool generalNotification = false;
  bool sound = false;
  bool dontDisturbMode = false;
  bool vibrate = false;
  bool lockScreen = false;
  bool reminders = false;

  void toggleGeneralNotification(bool value) {
    generalNotification = value;
    notifyListeners();  
  }


  void toggleSound(bool value) {
    sound = value;
    notifyListeners();
  }

  
  void toggleDontDisturbMode(bool value) {
    dontDisturbMode = value;
    notifyListeners();
  }

  
  void toggleVibrate(bool value) {
    vibrate = value;
    notifyListeners();
  }


  void toggleLockScreen(bool value) {
    lockScreen = value;
    notifyListeners();
  }

  void toggleReminders(bool value) {
    reminders = value;
    notifyListeners();
  }
}
