import 'package:customer/screens/dashboard/DashboardScreen.dart';
import 'package:customer/screens/login/LoginScreen.dart';
import 'package:customer/screens/splash/SplashScreen.dart';
import 'package:customer/screens/tabview/TabScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
