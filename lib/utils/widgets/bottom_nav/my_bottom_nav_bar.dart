import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar(
      {super.key,
      required this.clItemList,
      required this.clIndexPage,
      required this.clOnTap});

  final List<BottomNavigationBarItem> clItemList;
  final int clIndexPage;
  final Function(int)? clOnTap;

  final Color lSelectedItemColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: clItemList,
      currentIndex: clIndexPage,
      onTap: clOnTap,
      selectedItemColor: lSelectedItemColor,
    );
  }
}
