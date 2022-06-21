import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:center_of_gravity/constants/route_name.dart';
import 'package:center_of_gravity/locator.dart';
import 'package:center_of_gravity/models/model_data_device.dart';
import 'package:center_of_gravity/services/navigation_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  Device? device;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _buildQrView(context)),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 5),
                        child: MaterialButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.data == false) {
                                return Container(
                                  height: 80,
                                  width: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.flash_off,
                                        size: 25,
                                      ),
                                      Text("OFF")
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 80,
                                  width: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.flash_on,
                                        size: 25,
                                      ),
                                      Text("ON")
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 5),
                        child: MaterialButton(
                          onPressed: () async {
                            await controller?.flipCamera();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                if (describeEnum(snapshot) == 'back') {
                                  return Container(
                                    height: 80,
                                    width: 40,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_rear,
                                          size: 25,
                                        ),
                                        Text("Back")
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: 80,
                                    width: 40,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_front,
                                          size: 25,
                                        ),
                                        Text("Front")
                                      ],
                                    ),
                                  );
                                }
                              } else {
                                return Text('loading');
                              }
                            },
                          ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 800 ||
        MediaQuery.of(context).size.height < 800)
        ? 300.0
        : 600.0;

    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void inputQrData(Barcode result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (result.code!.isNotEmpty) {
      String? jsonData = await result.code;
      //print(jsonData);
      await prefs.setString('datadevice', jsonData!);
      print('[result QR $jsonData');
      controller?.stopCamera();
      controller?.dispose();
      _navigationService.navigateTo(loginViewRoute);
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        inputQrData(result!);
        controller.dispose();
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}