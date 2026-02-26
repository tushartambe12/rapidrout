import 'package:flutter/material.dart';

/// Simple user state management (singleton pattern like CartState)
class UserState extends ChangeNotifier {
  static final UserState _instance = UserState._internal();
  factory UserState() => _instance;
  UserState._internal();

  String _userName = '';
  String _phoneNumber = '';
  String _address = '';
  String _email = '';

  String get userName => _userName;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get email => _email;
  bool get isLoggedIn => _userName.isNotEmpty;

  void login(String name, String phone) {
    _userName = name;
    _phoneNumber = phone;
    notifyListeners();
  }

  void updateProfile({
    String? name,
    String? phone,
    String? address,
    String? email,
  }) {
    if (name != null) _userName = name;
    if (phone != null) _phoneNumber = phone;
    if (address != null) _address = address;
    if (email != null) _email = email;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    _phoneNumber = '';
    _address = '';
    _email = '';
    notifyListeners();
  }
}

// Global user instance
final userState = UserState();
