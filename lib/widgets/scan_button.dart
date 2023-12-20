import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/utils.dart';

import '../services/app_services.dart';

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
          ScanMode.QR,
        );

        // final barcodeScanRes = 'geo:-33.49,-70.66';
        // final barcodeScanRes = 'https://www.facebook.com';

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListService>(context, listen: false);
        final scanModelRes = await scanListProvider.newScan(barcodeScanRes);

        // print('The barcode is: $barcodeScanRes');

        launchURL(context, scanModelRes);
      },
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
