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
      body: ListView(
  children: const <Widget>[
    Card(child: ListTile(title: Text('One-line ListTile'))),
    Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with leading widget'),
      ),
    ),
    Card(
      child: ListTile(
        title: Text('One-line with trailing widget'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with both widgets'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        title: Text('One-line dense ListTile'),
        dense: true,
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 56.0),
        title: Text('Two-line ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text('Three-line ListTile'),
        subtitle: Text(
          'A sufficiently long subtitle warrants three lines.'
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
  ],
)
      bottomNavigationBar: NavBottom(),
    );
  }
}
