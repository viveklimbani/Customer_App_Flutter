import 'package:flutter/material.dart';

class TabPerson extends StatefulWidget {
  const TabPerson({Key? key}) : super(key: key);

  @override
  _TabPersonState createState() => _TabPersonState();
}

class _TabPersonState extends State<TabPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("TabPerson"),
        ),
      ),
    );
  }
}
