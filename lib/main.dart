import 'package:flutter/material.dart';

import 'pages/app_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader',
      // theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes : {
        'home' : ( _ ) => HomeScreen(),
        'map' : ( _ ) => MapScreen(),
      }
    );
  }
}