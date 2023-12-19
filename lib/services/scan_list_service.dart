import 'package:flutter/material.dart';
import 'package:qr_scanner/models/app_models.dart';

import 'app_services.dart';

class ScanListService extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(value: value);
    // DBService.db.newScan(newScan);
    final id = await DBService.db.newScan(newScan);

    // Assign the ID to the model
    newScan.id = id;

    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  loadScans() async {
    final scans = await DBService.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBService.db.getScansByType(type);
    this.scans = [...scans];
    selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBService.db.deleteAll();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBService.db.deleteScan(id);
    loadScansByType(selectedType);
  }
}
