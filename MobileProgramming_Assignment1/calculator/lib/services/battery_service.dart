import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryService {
  final Battery _battery = Battery();

  void initialize() {
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        _checkBatteryLevel();
      }
    });
  }

  void _checkBatteryLevel() async {
    int batteryLevel = await _battery.batteryLevel;
    if (batteryLevel >= 90) {
      _showToast("Battery level reached 90%");
      // Implement ringing functionality here
    }
  }

  void _showToast(String message) {
    // Implement toast message here
    // You might want to use a package like fluttertoast for this
  }
}
