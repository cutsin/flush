import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import '../nav/top.dart';

class QRCodeScanner extends StatefulWidget {
  QRCodeScanner({Key key}) : super(key: key);

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  var qrText = 'ss://';
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
    return LayoutBuilder(builder: (_context, constraints) {
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
            appBar: NavTop(title: 'Scan QRCode', type: 'back' , background: Colors.transparent),
          ),
          Positioned(
            top: constraints.biggest.height / 2 + 106,
            left: 50.0,
            right: 50.0,
            child: Center(
              child: Text(qrText, style: TextStyle(color: Colors.white, fontSize: 14))
            ),
          ),
        ]
      );
    });
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