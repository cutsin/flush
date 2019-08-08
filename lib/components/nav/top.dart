import 'package:flutter/material.dart';
import '../qrcode/scan-button.dart';

const TextStyle _titleStyle = TextStyle(fontWeight: FontWeight.bold);


class NavTop extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final List actions;

  // Constructor
  NavTop({@required this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: _titleStyle),
      centerTitle: true,
      leading: leading,
      actions: actions,
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

Widget navTopScanner ({@required title}) {
  return NavTop(
    title: title,
    leading: QRCodeScanButton(),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add),
        tooltip: 'Add',
        onPressed: () {
          print('Add manualy');
      }),
    ]
  );
}