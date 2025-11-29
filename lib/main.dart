// main.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(FreshMarketApp());
}

class FreshMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fresh Market',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}
