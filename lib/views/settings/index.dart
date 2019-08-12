import 'package:flutter/material.dart';
// 
import '../../app.dart';
import '../../components/nav/bottom.dart';
import '../../components/nav/top.dart';

class SettingsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flush',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Settings(title: 'Settings'),
    );
  }
}

class Settings extends StatefulWidget {
  Settings({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: NavTop(title: 'Settings'),
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
