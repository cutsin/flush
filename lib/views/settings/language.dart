import 'package:flutter/material.dart';
// 
import '../../components/nav/top.dart';

class LanguageComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flush',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Language(title: 'Language'),
    );
  }
}

class Language extends StatefulWidget {
  Language({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: NavTop(title: 'Language', type: 'back'),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('English'),
              trailing: Icon(Icons.check),
            ),
          ]
        ).toList()
      ),
    );
  }
}
