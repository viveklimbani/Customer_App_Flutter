import 'package:flutter/material.dart';

class TabQrCode extends StatefulWidget {
  const TabQrCode({Key? key}) : super(key: key);

  @override
  _TabQrCodeState createState() => _TabQrCodeState();
}

class _TabQrCodeState extends State<TabQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("TabQrCode"),
        ),
      ),
    );
  }
}

