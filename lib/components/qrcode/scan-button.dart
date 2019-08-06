import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './scanner.dart';


class QRCodeScanButton extends StatefulWidget {
  @override
  _QRCodeScanButtonState createState() => _QRCodeScanButtonState();
}

class _QRCodeScanButtonState extends State<QRCodeScanButton> {
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
      onPressed: () {
        print('dd11');

        
        scanQrText(context)
          .then((res) {
            print('${res}dadsf');
          });
        // Fullscreen Dialog
        // Navigator.of(context).push(MaterialPageRoute<Null>(
        //   builder: (BuildContext context) {
        //     return ScanQRCodePage();
        //   },
        //   fullscreenDialog: true
        // ));

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