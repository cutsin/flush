import 'package:flutter/material.dart';
//
import '../../app.dart';
import '../../components/nav/bottom.dart';
import '../../components/nav/top.dart';
import '../../components/theme-manager.dart';

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
      appBar: NavTop(title: I18n.of(context).Settings),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text(I18n.of(context).Language),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                App.router.navigateTo(context, '/settings/language');
              },
            ),
            SwitchListTile(
              value: themeManager.dark,
              secondary: Icon(Icons.color_lens),
              title: Text(I18n.of(context).Theme),
              onChanged: (v) {
                themeManager.changeTheme();
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(I18n.of(context).About),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('about');
              },
            ),
          ]
        ).toList()
      ),
      bottomNavigationBar: NavBottom(),
    );
  }
}
