import 'dart:async';

import 'package:customer/common/resource/images.dart';
import 'package:customer/screens/dashboard/tabscreen/TabHome.dart';
import 'package:customer/screens/tabview/TabScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabScreen()),
    );
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    // To make this screen full screen.
    // It will hide status bar and notch.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // full screen image for splash screen.
    return Container(child: new Image.asset(Images.icSplash, fit: BoxFit.fill));
  }
}
