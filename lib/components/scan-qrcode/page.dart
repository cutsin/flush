import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

List<CameraDescription> cameras;

class ScanQRCodePage extends StatefulWidget {
  @override
  _ScanQRCodePageState createState() => _ScanQRCodePageState();
}

class _ScanQRCodePageState extends State<ScanQRCodePage> {
  QRReaderController controller;
  Future _future;

   void onCodeRead(dynamic value) {
    print('-----------${value.toString()}');
    new Future.delayed(const Duration(seconds: 5), controller.startScanning);
  }

  Future getCamera() async {
    try {
      cameras = await availableCameras();
    } on QRReaderException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.description}');
    }
    print(cameras);
    print('step0');
    controller = QRReaderController(cameras[0], ResolutionPreset.low,
        [CodeFormat.qr, CodeFormat.pdf417], onCodeRead);
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        print('----Camera error ${controller.value.errorDescription}');
      }
    });
    try {
      print('step2');
      await controller.initialize();
    } on QRReaderException catch (e) {
      print('-------${e.code}------${e.description}');
      print('------Error: ${e.code}\n${e.description}');
    }
     if (mounted) {
      setState(() {});
      controller.startScanning();
    }
  }

  @override
  void initState() {
    super.initState();
    _future = getCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
              if (!controller.value.isInitialized) {
                return Container();
              }
              return AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: QRReaderPreview(controller)
              );
        }
        return null;
      }
    );
  }
}