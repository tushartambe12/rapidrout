import 'package:flutter/material.dart';

/// Singleton theme state to toggle dark/light mode across the app.
class ThemeState extends ChangeNotifier {
  static final ThemeState _instance = ThemeState._internal();
  factory ThemeState() => _instance;
  ThemeState._internal();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggle() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}

// Global theme instance
final themeState = ThemeState();
