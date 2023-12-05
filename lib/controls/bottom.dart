// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomControls extends StatefulWidget {
  BottomControls({super.key, required this.onTabChange});
  void Function(int)? onTabChange;

  @override
  State<BottomControls> createState() => _BottomControlsState();
}

class _BottomControlsState extends State<BottomControls> {
  @override
  Widget build(BuildContext context) {
    return _BuildPage();
  }

  Widget _BuildPage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: GNav(
        onTabChange: (value) => widget.onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        backgroundColor: Colors.white.withOpacity(.5),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        tabs: [
          GButton(
            icon: EvaIcons.homeOutline,
            text: 'Trang chủ',
          ),
          GButton(
            icon: Icons.storefront_outlined,
            text: 'Mua sắm',
          ),
          GButton(
            icon: EvaIcons.bellOutline,
            text: 'Thông báo',
          ),
          GButton(
            icon: Icons.person_outlined,
            text: 'Trang cá nhân',
          ),
        ],
      ),
    );
  }
}
