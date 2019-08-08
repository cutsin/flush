import 'package:flutter/material.dart';
// 
import '../components/nav/bottom.dart';
import '../components/nav/top.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
              style: optionStyle,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBottom(),
    );
  }
}
