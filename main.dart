import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ClinicFinderApp());
}

class ClinicFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinic Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
    );
  }
}
