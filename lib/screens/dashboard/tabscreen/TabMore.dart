import 'package:customer/screens/tabview/TabScreen.dart';
import 'package:flutter/material.dart';

class TabMore extends StatefulWidget {
  const TabMore({Key? key}) : super(key: key);

  @override
  _TabMoreState createState() => _TabMoreState();
}

class _TabMoreState extends State<TabMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabScreen()),
                  ),
              child: Text(
                "Logout",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
