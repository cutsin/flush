import 'package:flutter/material.dart';
// 
import '../../app.dart';
import '../../components/nav/bottom.dart';
import '../../components/nav/top.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: NavTop(title: 'Settings', type: 'scan'),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                App.router.navigateTo(context, '/settings/language');
              },
            ),
            ListTile(
              title: Text('One-line dense ListTile'),
            ),
          ]
        ).toList()
      ),
      bottomNavigationBar: NavBottom(),
    );
  }
}
