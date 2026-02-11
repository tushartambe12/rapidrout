import 'package:flutter/material.dart';

/// Simple booking state management
class BookingState extends ChangeNotifier {
  static final BookingState _instance = BookingState._internal();
  factory BookingState() => _instance;
  BookingState._internal();

  String? _lastBooking;
  bool _showBanner = false;

  String? get lastBooking => _lastBooking;
  bool get showBanner => _showBanner;

  void confirmBooking(
    String providerName,
    String serviceName,
    String date,
    String time,
  ) {
    _lastBooking = '$serviceName with $providerName on $date at $time';
    _showBanner = true;
    notifyListeners();

    // Auto-hide banner after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      dismissBanner();
    });
  }

  void dismissBanner() {
    _showBanner = false;
    notifyListeners();
  }
}

// Global booking instance
final bookingState = BookingState();
