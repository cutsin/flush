import 'package:flutter/material.dart';
// 
import '../../app.dart';
import '../../router/routes.dart';

// Common state
int selectedNavIndex = 0;

class NavBottom extends StatefulWidget {
  NavBottom({Key key}) : super(key: key);
  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  @override
  Widget build(BuildContext context) {

    // Generate Items
    List<BottomNavigationBarItem> _navs = [];
    Map<num, dynamic> navIndexMap = {};
    routes.forEach((k, v) {
      num navBottomIndex = v['navBottomIndex'];
      if (navBottomIndex == null) return;
      _navs.add(BottomNavigationBarItem(
        icon: Icon(v['icon']),
        title: Text(v['title']),
      ));
      navIndexMap[navBottomIndex] = v;
    });

    return BottomNavigationBar(
      items: _navs,
      currentIndex: selectedNavIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (num index) {
        setState(() => selectedNavIndex = index);
        // Disable transtion
        var nav = navIndexMap[index];
        App.router.navigateTo(context, nav['path'], transitionDuration: nav['duration']);
      },
    );
  }
}