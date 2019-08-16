import 'package:flutter/material.dart';
//
import '../app.dart';
import '../components/nav/bottom.dart';
import '../components/nav/top.dart';
import '../components/random-avt.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale);
    print(i18n.supportedLocales);
    return Scaffold(
      appBar: NavTop(title: I18n.of(context).Home, type: 'scan2'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RandomAvt(),
          ],
        ),
      ),
      bottomNavigationBar: NavBottom(),
    );
  }
}
