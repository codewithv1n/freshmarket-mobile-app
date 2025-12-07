import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const FreshMarketApp());
}

class FreshMarketApp extends StatelessWidget {
  const FreshMarketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Market',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const LoginScreen(), // Entry point
      debugShowCheckedModeBanner: false,
    );
  }
}
