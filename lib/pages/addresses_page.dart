import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/widgets/app_widgets.dart';

import '../services/app_services.dart';

class AddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // We have to listen, because we're inside a build and we want the
    // widget to be redrawn when the data changes
    final scanListProvider =
        Provider.of<ScanListService>(context, listen: true);
    final scans = scanListProvider.scans;

    return ScanListView(scans: scans);
  }
}
