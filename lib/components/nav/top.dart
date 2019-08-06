import 'package:flush/main.dart';
import 'package:flutter/material.dart';
import '../qrcode/scan-button.dart';

const TextStyle _titleStyle = TextStyle(fontWeight: FontWeight.bold);

class NavTop extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  // Constructor
  NavTop(this._title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title, style: _titleStyle),
      centerTitle: true,
      leading: QRCodeScanButton(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          tooltip: 'Add',
          onPressed: () {
            scaffoldKey.currentState.showSnackBar(snackBar);
        }),
      ]
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}