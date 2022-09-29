// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/scanner/scanner.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/scaffold.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  ScannerController scannerController = Get.find<ScannerController>();
  late final double height, width;

  @override
  void initState() {
    super.initState();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // var scanArea = (width < 400 || height < 400) ? 150.0 : 300.0;

    return GesbukUserScaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
              height: height,
              width: width,
              child: QRView(
                key: qrKey,
                onQRViewCreated: scannerController.scanning.isTrue
                    ? _doNothing
                    : _onQrCodeReading,
                cameraFacing: CameraFacing.back,
                overlay: QrScannerOverlayShape(
                  borderColor: AppColors.mainColor,
                  borderRadius: 16.0,
                  // borderLength: 30,
                  borderWidth: 4.0,
                  // cutOutSize: scanArea
                ),
                onPermissionSet: (ctrl, p) =>
                    _onPermissionSet(context, ctrl, p),
              )),
          Positioned(
              width: width,
              top: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: AppColors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flash_off,
                          color: AppColors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_rear_rounded,
                          color: AppColors.white,
                        )),
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            width: width,
            child: Container(
              padding: const EdgeInsets.all(AppSizes.sidePadding),
              decoration: const BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0))),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.tips_and_updates_outlined,
                    size: 16.0,
                    color: Theme.of(context).textTheme.caption?.color,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Flexible(
                    child: Text(
                        'Arahkan kode QR ke area Scanner',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _doNothing(QRViewController controller) {
    print('stopped');
  }

  void _onQrCodeReading(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      scannerController.setQRViewController(controller);
      scannerController.setScanning(true);
      // homeController.setQRUrl(scanData, height, width);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
