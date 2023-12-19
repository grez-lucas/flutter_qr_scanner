import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF',
          'Cancel',
          false,
          ScanMode.BARCODE,
        );

        if (barcodeScanRes == '-1') {
          return;
        }

        print('The barcode is: $barcodeScanRes');
      },
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
