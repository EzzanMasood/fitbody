import 'package:flutter/material.dart';

class GoalSelectionProvider extends ChangeNotifier {
  String? _selectedGoal;

  final List<String> goals = [
    'Lose Weight',
    'Gain Weight',
    'Muscle Mass Gain',
    'Shape Body',
    'Others',
  ];

  String? get selectedGoal => _selectedGoal;

  void setSelectedGoal(String goal) {
    _selectedGoal = goal;
    notifyListeners(); 
  }
}
