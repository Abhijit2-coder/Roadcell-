import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> _userData = {};

  Map<String, dynamic> get userData => _userData;

  String get fullName => _userData['full_name'] ?? 'User';
  String get mobile => _userData['mobile'] ?? '';
  String get email => _userData['email'] ?? '';
  String get dob => _userData['dob'] ?? '';
  String get aadhaar => _userData['aadhaar'] ?? '';
  String get licenceNumber => _userData['licence_number'] ?? '';

  void setUserData(Map<String, dynamic> data) {
    _userData = data;
    notifyListeners();
  }

  void clearUserData() {
    _userData = {};
    notifyListeners();
  }
}
