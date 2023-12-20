import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/app_pages.dart';

import '../services/app_services.dart';
import '../widgets/app_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('History'),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                // Listen = false because we're inside a method
                // and otherwise we'd get an error
                final scanListProvider =
                    Provider.of<ScanListService>(context, listen: false);
                scanListProvider.deleteAll();
              }),
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtain currentMenuOpt from the provider
    final uiProvider = Provider.of<UiService>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListService>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsHistoryScreen();
      case 1:
        scanListProvider.loadScansByType('http');
        return AddressesScreen();
      default:
        return const MapsHistoryScreen();
    }
  }
}
