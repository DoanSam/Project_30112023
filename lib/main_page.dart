import 'package:flutter/material.dart';
import 'package:project_30112023/controls/bottom.dart';
import 'package:project_30112023/controls/header.dart';
import 'package:project_30112023/pages/home/home_page.dart';
import 'package:project_30112023/pages/maill/maill_page.dart';
import 'package:project_30112023/pages/notification/notification_page.dart';
import 'package:project_30112023/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  void navigateBottom(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: HeaderControls(),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            HomePage(),
            MallPage(),
            NotifiCationPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomControls(
          onTabChange: (index) => navigateBottom(index),
        ));
  }
}
