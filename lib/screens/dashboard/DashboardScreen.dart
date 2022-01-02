import 'package:customer/common/resource/Dimension.dart';
import 'package:customer/common/resource/images.dart';
import 'package:customer/common/utils/Validator.dart';
import 'package:customer/screens/dashboard/tabscreen/TabBook.dart';
import 'package:customer/screens/dashboard/tabscreen/TabHome.dart';
import 'package:customer/screens/dashboard/tabscreen/TabMore.dart';
import 'package:customer/screens/dashboard/tabscreen/TabPerson.dart';
import 'package:customer/screens/dashboard/tabscreen/TabQrCode.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ///Local vars
  Validator validator = Validator();
  int dashboardIndex = 0;

  Map<TextEditingController, String> errors = {};

  ///Tabs
  late List<Widget> bottomTabs;
  List<String>? bottomNavItemNames;
  List<String>? bottomNavItemIcons;
  late PageController _pageController;

  late TabHome tabHome;
  late TabBook tabBook;
  late TabQrCode tabQrCode;
  late TabPerson tabPerson;
  late TabMore tabMore;

  static const TAB_HOME = 0;
  static const TAB_BOOK = 1;
  static const TAB_QR_CODE = 2;
  static const TAB_PERSON = 3;
  static const TAB_MORE = 4;

  @override
  void initState() {
    super.initState();

    ///Init page controller
    _pageController = PageController(initialPage: dashboardIndex);

    ///Init tab instances
    tabHome = TabHome();
    tabBook = TabBook();
    tabQrCode = TabQrCode();
    tabPerson = TabPerson();
    tabMore = TabMore();

    prepareTabs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: getBottomAppBar,
      body: getDashboardBox,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pageController.jumpToPage(2);

          setState(() {
            dashboardIndex = 2;
          });
        },
        child: Image.asset(
          Images.icQrCode,
          width: Spacing.large,
          height: Spacing.large,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2.0,
      ),
    );
  }

  get getDashboardBox => Container(
        // systemStatusStyle: SystemStatusStyle.light,
        child: PageView(
          controller: _pageController,
          children: bottomTabs,
          physics: NeverScrollableScrollPhysics(),
        ),
      );

  get getBottomNavigationBar => BottomNavigationBar(
        backgroundColor: Colors.white,
        items: getBottomNavigationBarItems(),
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        currentIndex: dashboardIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);

          setState(() {
            dashboardIndex = index;
          });
        },
      );

  get getBottomAppBar => BottomAppBar(
        elevation: 5.0,
        clipBehavior: Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.grey,
        child: getBottomNavigationBar,
      );

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    List<BottomNavigationBarItem> listOfBottomWidgets = [];

    for (int i = 0; i < bottomNavItemNames!.length; i++) {
      if (bottomNavItemIcons![i].isEmpty) {
        listOfBottomWidgets.add(BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: Container(
                height: 65,
              ),
            ),
            title: Container(
              height: 0,
            )));
      } else {
        listOfBottomWidgets.add(BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(Spacing.xSmall),
              child: Image.asset(
                bottomNavItemIcons![i],
                color: dashboardIndex == i ? Colors.blue : Colors.grey,
                height: dashboardIndex == i ? 20 : 18,
              ),
            ),
            title: Text(
              bottomNavItemNames![i],
              style: TextStyle(
                color: dashboardIndex == i ? Colors.blue : Colors.white,
              ),
            )));
      }
    }

    return listOfBottomWidgets;
  }

  void prepareTabs() {
    bottomTabs = [tabHome, tabBook, tabQrCode, tabPerson, tabMore];
    bottomNavItemNames = [
      '',
      '',
      '',
      '',
      '',
    ];
    bottomNavItemIcons = [
      Images.icHome,
      Images.icBook,
      '',
      Images.icPerson,
      Images.icMenu,
    ];
  }
}
