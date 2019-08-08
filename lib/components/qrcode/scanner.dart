import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

const flash_on = "FLASH ON";
const flash_off = "FLASH OFF";
const back_camera = "BACK CAMERA";

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({
    Key key,
  }) : super(key: key);

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  var qrText = 'ss://';
  var flashState = flash_on;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.greenAccent,
            borderRadius: 0,
            borderLength: 10,
            borderWidth: 3,
            cutOutSize: 180,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Scan QRCode'),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: 'Back',
              onPressed: () {
                print('Add manualy');
            }),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.folder),
            //     tooltip: 'Read',
            //     onPressed: () {
            //       print('Read from file');
            //   }),
            // ]
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(50, 0, 0, 50),
            alignment: Alignment(1.0, 0.5),
            child: Text(qrText, style: TextStyle(color: Colors.white)),
          ),
        )
      ]
    );
  }
}

Future scanQrCode(BuildContext context) async {
  return await Navigator.of(context).push(MaterialPageRoute<String>(
    builder: (BuildContext context) {
      return QRCodeScanner();
    },
    fullscreenDialog: true
  ));
} 