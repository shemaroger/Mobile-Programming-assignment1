import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  void initialize() {
    connectivityStream.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _showToast("No internet connection");
      } else {
        _showToast("Internet connection restored");
      }
    });
  }

  void _showToast(String message) {
    // Implement toast message here
    // You might want to use a package like fluttertoast for this
  }
}
