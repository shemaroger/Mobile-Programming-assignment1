import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:second/services/connectivity_service.dart';
import 'package:second/services/battery_service.dart';
import 'package:second/services/theme_service.dart';
import 'package:second/project/first_page.dart';
import 'package:second/project/login_page.dart';
import 'package:second/project/signup.dart';
import 'package:second/project/calculator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  final ConnectivityService _connectivityService = ConnectivityService();
  final BatteryService _batteryService = BatteryService();

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _connectivityService.initialize();
    _batteryService.initialize();
  }

  void _loadTheme() async {
    final savedThemeMode = await ThemeService.getThemeMode();
    setState(() {
      _themeMode = savedThemeMode;
    });
  }

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      ThemeService.setThemeMode(_themeMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-learning Platform',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/calculator': (context) => CalculatorPage(),
      },
    );
  }
}
