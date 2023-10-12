import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';
import 'package:provider/provider.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get themeData => _isDarkMode
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData.light(useMaterial3: true);

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.themeData, // Use the theme from the provider
      home: const WeatherScreen(),
    );
  }
}