import 'package:flutter/material.dart';
import 'package:myapp_flutter/utils/widgets/bottom_nav/my_bottom_nav_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Widget p =
      LoadingAnimationWidget.halfTriangleDot(color: Colors.red, size: 50);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text('Home Screen'),
        for (var i = 0; i < 2; i++) Text('Home Screen'),
        Expanded(child: p)
      ]),
    );
  }
}
