library home;

import 'package:dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media/media.dart';
import 'package:more/more.dart';
import 'package:watch/watch.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with TickerProviderStateMixin {
  int _selectedIndex = 1;
  final pages = [
    DashBoardPage(),
    WatchPage(),
    MediaPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      bottomNavigationBar: BottomNavigationBarCustom(
        onTap1: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
        onTap2: () {
          setState(() {
            _selectedIndex = 1;
          });
        },
        onTap3: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        onTap4: () {
          setState(() {
            _selectedIndex = 3;
          });
        },
        selectedIndex: _selectedIndex,
      ),
      body: Container(child: pages[_selectedIndex]),
    );
  }
}
