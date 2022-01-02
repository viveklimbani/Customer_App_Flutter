import 'package:customer/common/resource/images.dart';
import 'package:customer/screens/login/LoginScreen.dart';
import 'package:customer/screens/register/RegisterScreen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Images.icHeader), fit: BoxFit.cover)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      height: 50,
                      text: 'Login',
                    ),
                    Tab(
                      height: 20,
                      text: "Sign Up",
                    ),
                  ],
                  controller: _tabController,
                ),
              ],
            ),
          )),
      body: getMainLayout,
    );
  }

  get getMainLayout => Container(child: getTabBarView);

  get getTabBarView => TabBarView(
        children: [
          LoginScreen(),
          RegisterScreen(),
        ],
        controller: _tabController,
      );
}
