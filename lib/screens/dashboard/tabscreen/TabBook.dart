import 'package:flutter/material.dart';

class TabBook extends StatefulWidget {
  const TabBook({Key? key}) : super(key: key);

  @override
  _TabBookState createState() => _TabBookState();
}

class _TabBookState extends State<TabBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("TabBook"),
        ),
      ),
    );
  }
}
