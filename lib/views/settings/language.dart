import 'package:flutter/material.dart';
// 
import '../../components/nav/top.dart';

class LanguageView extends StatefulWidget {
  LanguageView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
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
