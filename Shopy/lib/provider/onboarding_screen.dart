import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  // Current page index
  int _currentPage = 0;

  int get currentPage => _currentPage;

  // Update current index when page scrolls
  void updatePageIndicator(int index) {
    _currentPage = index;
    notifyListeners(); // Notify UI to update
  }

  // Jump to a specific page when dot is clicked
  void dotNavigationClick(int index) {
    _currentPage = index;
    notifyListeners(); // Notify UI to update
  }

  // Go to next page
  void nextPage() {
    _currentPage++;
    notifyListeners(); // Notify UI to update
  }

  // Skip to last page
  void skipPage(int totalPages) {
    _currentPage = totalPages - 1;
    notifyListeners(); // Notify UI to update
  }
}
