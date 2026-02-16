import 'package:flutter/material.dart';

/// Simple user state management (singleton pattern like CartState)
class UserState extends ChangeNotifier {
  static final UserState _instance = UserState._internal();
  factory UserState() => _instance;
  UserState._internal();

  String _userName = '';
  String _phoneNumber = '';

  String get userName => _userName;
  String get phoneNumber => _phoneNumber;
  bool get isLoggedIn => _userName.isNotEmpty;

  void login(String name, String phone) {
    _userName = name;
    _phoneNumber = phone;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    _phoneNumber = '';
    notifyListeners();
  }
}

// Global user instance
final userState = UserState();
