import 'package:flutter/material.dart';

class ScanQRCodeIcon extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.camera_alt),
      tooltip: 'Scan QRCode',
      onPressed: () async {
        // final barcode = await Navigator.of(context).push<Barcode>(
        //   MaterialPageRoute(
        //     builder: (c) {
        //       return ScanPage();
        //     },
        //   ),
        // );
        // if (barcode != null) {
        //   print(barcode);
        // }
        print('dd');
      }
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}