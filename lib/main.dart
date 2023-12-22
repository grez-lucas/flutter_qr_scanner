import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/login_page.dart';

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
      ChangeNotifierProvider( create: (_) => AuthService(), lazy: false),
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
      initialRoute: 'checkAuth',
      routes: {
        'home': (_) => const HomeScreen(),
        'map': (_) => const MapScreen( ),

        'login' : ( _ ) => const LoginScreen(),
        'register' : ( _ ) =>const RegisterScreen(),
        'checkAuth' : ( _ ) => const CheckAuthScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.lightGreen,
        ),
      ),
    );
  }
}
