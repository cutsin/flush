import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ScanQRCodeButton extends StatefulWidget {
  @override
  _ScanQRCodeButtonState createState() => _ScanQRCodeButtonState();
}

class _ScanQRCodeButtonState extends State<ScanQRCodeButton> {
  // Future<String> _barcodeString;
  
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(MaterialCommunityIcons.getIconData('qrcode-scan')),
      tooltip: 'Scan QRCode',
      onPressed: () async {
        print('dd11');
        // showGeneralDialog(
        //   context: context,
        //   barrierLabel: '',
        //   barrierDismissible: true,
        //   transitionDuration: Duration(milliseconds: 500),
        //   barrierColor: Colors.black.withOpacity(0.5),
        //   pageBuilder: (BuildContext context, Animation animation,
        //       Animation secondaryAnimation) {
        //     return Center(
        //       child: Text(
        //         'ddfjjs',
        //         style: Theme.of(context).textTheme.display1,
        //       ),
        //     );
        //   },
        // );
        setState(() {
          // _barcodeString = ;
        });
      }
    );
  }
}