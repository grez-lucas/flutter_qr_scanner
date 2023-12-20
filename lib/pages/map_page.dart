import 'package:flutter/material.dart';

import '../models/app_models.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel? scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel?;
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.my_location),
          ),
        ],
      ),
      body: Center(
        child: Text(scan!.value),
      ),
    );
  }
}
