import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
