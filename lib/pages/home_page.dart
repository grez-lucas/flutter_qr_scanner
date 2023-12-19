import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/app_pages.dart';

import '../models/app_models.dart';
import '../services/app_services.dart';
import '../widgets/app_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {}),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
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

    // Temp: Read the database
    final tempScan = ScanModel(value: 'http://google.com');
    DBService.db.getAllScans().then((value) => print(value));

    switch (currentIndex) {
      case 0:
        return MapsHistoryScreen();
      case 1:
        return AddressesScreen();
      default:
        return MapsHistoryScreen();
    }
  }
}
