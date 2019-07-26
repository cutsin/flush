import 'package:flutter/material.dart';
// 
import '../app.dart';
import '../router/routes.dart';

class NavBottom extends StatefulWidget {
  NavBottom({Key key}) : super(key: key);

  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentPath = () => ModalRoute.of(context)?.settings?.name; 
    print(currentPath() + '????');

    // Generate Items
    List <BottomNavigationBarItem>_navs = [];
    var navIndexMap = {};
    routes.forEach((k, v) {
      num navBottomIndex = v['navBottomIndex'];
      if (navBottomIndex == null) return;
      _navs.add(BottomNavigationBarItem(
        icon: Icon(v['icon']),
        title: Text(v['title']),
      ));
      navIndexMap[navBottomIndex] = v['path'];
      navIndexMap[v['path']] = navBottomIndex;
    });

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = 1;
      });
      App.router.navigateTo(context, navIndexMap[index]);
    }

    return BottomNavigationBar(
      items: _navs,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
