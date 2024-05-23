import 'package:flutter/material.dart';
import 'package:myapp_flutter/screens/bookmark_screen.dart';
import 'package:myapp_flutter/screens/home_screen.dart';
import 'package:myapp_flutter/utils/my_utils.dart';
import 'package:myapp_flutter/utils/widgets/bottom_nav/my_bottom_nav_bar.dart';
import '../models/products.dart';

class MainWrapper extends StatefulWidget {
  MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  int selectedIndex = 0;

  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      HomeScreen(),
      BookmarkScreen(
        items: pitems,
      ),
    ];

    var maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        bottomNavigationBar:
            MyBottomNavBar(clItemList: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Home')
        ], clOnTap: _ontab, clIndexPage: selectedIndex),
        body: Center(
          child: listWidget.elementAt(selectedIndex),
        ));
  }

  Future<void> _ontab(int index) async {
    final bool b = await MyApp().showAlertDialog(context, "", "",
        clbtnOkCancel: "Cancel", clbtnOkTitle: "Ok");

    MyApp().showSnakBarMsg(context, b ? "true" : "false", clDurationMillSec: 5);

    setState(() {
      selectedIndex = index;
    });
  }
}
