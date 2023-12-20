import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/app_pages.dart';
import 'services/app_services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UiService(), lazy: false),
      ChangeNotifierProvider(create: (_) => ScanListService(), lazy: false),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader',
      // theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'map': (_) => MapScreen( ),
      },
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.lightGreen,
        ),
      ),
    );
  }
}
