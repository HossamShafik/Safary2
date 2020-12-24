import 'package:flutter/material.dart';

import 'drawer_screen.dart';
import 'home_screen.dart';

class AnimatedDrawer extends StatefulWidget {
  @override
  _AnimatedDrawerState createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.indigo,
          ),
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
