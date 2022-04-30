library watch;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';

import 'watchpage.dart';


class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MainPageView();
  }
}

class MainPageView extends StatefulWidget {
  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> with TickerProviderStateMixin {
  int _selectedIndex = 1;
  final pages = [
   WatchPage(),
    WatchPage(),
    WatchPage(),
    WatchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      bottomNavigationBar: BottomNavigationBarCustom(
        onTap1:(){
          setState(() {
            _selectedIndex=0;
          });

        },
        onTap2:(){
          setState(() {
            _selectedIndex=1;
          });

        },
        onTap3:(){
          setState(() {
            _selectedIndex=2;
          });


        },
        onTap4:(){
          setState(() {
            _selectedIndex=3;
          });


        },
        selectedIndex: _selectedIndex,
      ),
      body: Container(
        child: pages[_selectedIndex]
      ),
    );
  }

}
