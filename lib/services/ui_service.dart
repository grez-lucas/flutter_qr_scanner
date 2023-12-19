import 'package:flutter/material.dart';

class UiService extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }
}
