import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/screens/favorite_page.dart';
import 'package:quote_generator_mobile_app/screens/home_page.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: <Widget>[
            const Icon(Icons.add, size: 30),
            const Icon(Icons.list, size: 30),
            const Icon(Icons.compare_arrows, size: 30),
            const Icon(Icons.call_split, size: 30),
            const Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: AppColors.KscandalColor,
          backgroundColor: AppColors.KscafflodBackground[1],
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
           decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:AppColors.KscafflodBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:  SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HomePage(),
            ),)
        ));
  }
}
