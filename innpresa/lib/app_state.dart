import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryId = 0;

  void updateCategoryId(int selectedCategory) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}
