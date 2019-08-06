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

  _isFlashOn(String current) {
    return flash_on == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QRCode'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              print('ff');
          }),
        ]
      ),
      body: Container(
        child: QRView(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop('ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTp4TW91cFQ4ZzJoQm40UjlhTUh3SnpoOGVoSVNOWVY2bThydVBEbFJ4MnRjSkZSYmVpazZxcTNZOWRHSXMxcFd5WG1HZnR4QitJWHdKUGtMazVFak5MZw@108.160.136.144:443/?plugin=obfs-local%3bobfs%3dtls%3bobfs-host%3d10086.cn%3bfast-open%3b#Tokyo');
        },
        tooltip: 'Flash',
        child: Icon(Icons.code, color: Colors.black),
      ),
    );
  }
}

Future scanQrText(BuildContext context) async {
  return await Navigator.of(context).push(MaterialPageRoute<String>(
    builder: (BuildContext context) {
      return QRCodeScanner();
    },
    fullscreenDialog: true
  ));
} 