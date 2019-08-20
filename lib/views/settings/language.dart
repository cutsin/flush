import 'package:flutter/material.dart';
//
import '../../app.dart';
import '../../components/nav/top.dart';

Map _locales = {
  'en_US': ['English', 'en'],
  'zh_CN': ['中文', 'zh'],
};

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
    print(i18n.supportedLocales);
    Iterable<Widget> tiles = i18n.supportedLocales.map<Widget>((k) {
      print(k is String);
      return ListTile(
        title: Text('_locales[k]'),
        trailing: Icon(Icons.check),
      );
    });
    // Iterable<Widget> tiles = <Widget>[];
    // i18n.supportedLocales.forEach((k) {
    //   tiles.
    //   tiles.add(
    //     ListTile(
    //       title: _locales[k][0],
    //       trailing: Icon(Icons.check),
    //     ),
    //   );
    // });

    return Scaffold(
      appBar: NavTop(title: I18n.of(context).Language, type: 'back'),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList()
      ),
    );
  }
}
