import 'dart:convert';

import 'package:flutter/material.dart';
import '../qrcode/scan-button.dart';

import '../../app.dart';

const TextStyle _titleStyle = TextStyle(fontWeight: FontWeight.bold);

enum types { scan, back }

class NavTop extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String type;

  // Constructor
  NavTop({@required this.title, this.type, leading, actions, background});

  @override
  Widget build(BuildContext context) {
    Widget leading;
    List actions;
    Color background = Colors.black54;

    switch (type) {
      case 'scan': {
        leading = QRCodeScanButton();
        break;
      }
      case 'scan2': {
        leading = QRCodeScanButton();
        actions = <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              print('Add manualy');
          }),
        ];
        break;
      }
      case 'back': {
        background = Colors.transparent;
        leading = IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            // Navigator.of(context).pop();
            // App.router.navigateTo(context, '/settings', clearStack: true, transition: TransitionType.custom, transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            //   return SlideTransition(
            //     position: Tween<Offset>(
            //       begin: Offset(0.0, 0.0),
            //       end: Offset(1.0, 0.0),
            //     ).animate(animation),
            //     child: child,
            //   );
            // });
            App.router.pop(context);
          }
        );
        break;
      }
      print(leading);
    }
    json.decode('{"source": 1}').toString();
    [1,2,3].cast();
    return AppBar(
      title: Text(title, style: _titleStyle),
      centerTitle: true,
      leading: leading,
      actions: actions,
      backgroundColor: background,
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}