import 'package:flutter/material.dart';
//
import '../../app.dart';
import '../../components/nav/top.dart';

final Map _locales = {
  'en': 'English',
  'zh': '中文',
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
    Locale curLocale = Localizations.localeOf(context);
    print(curLocale.languageCode.runtimeType);
    var _cur = curLocale.languageCode;
    Iterable<Widget> tiles = i18n.supportedLocales.map<Widget>((k) {
      var _k = k.languageCode;
      Widget _check = Container(width: 0, height: 0);
      bool _enabled = true;
      if (_cur == _k) {
        _check = Icon(Icons.check);
        _enabled = false;
      }
      return ListTile(
        title: Text(_locales[_k]),
        trailing: _check,
        enabled: _enabled,
        onTap: () {
          print('okhhhh');
          Localizations.override(
            context: context,
            locale: k,
          );
          print(Localizations.localeOf(context));
        },
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
