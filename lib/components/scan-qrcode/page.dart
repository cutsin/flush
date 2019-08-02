// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

// List<CameraDescription> cameras;

// Future<Null> main() async {
//   cameras = await availableCameras();
//   print(cameras);
// }

// class ScanQRCodePage extends StatefulWidget {
//   @override
//   _ScanQRCodePageState createState() => _ScanQRCodePageState();
// }

// class _ScanQRCodePageState extends State<ScanQRCodePage> {
//   QRReaderController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = QRReaderController(cameras[0], ResolutionPreset.medium, [CodeFormat.qr], (dynamic value){
//         print(value); // the result!
//     // ... do something
//     // wait 3 seconds then start scanning again.
//     Future.delayed(const Duration(seconds: 3), controller.startScanning);
//     });
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//       controller.startScanning();
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return new Container();
//     }
//     return new AspectRatio(
//         aspectRatio:
//         controller.value.aspectRatio,
//         child: new QRReaderPreview(controller));
//   }
// }