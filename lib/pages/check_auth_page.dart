import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/app_services.dart';
import 'app_pages.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Read the authProvider status

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const Text('Espere...');
            }
            if (snapshot.data == '') {
              // Prevent a redirection loop duruing the build phase of the app
              Future.microtask(() {
                // This on it's own makes the transition look kind of ugly and janky
                // Navigator.pushReplacementNamed(context, 'login');

                // Instead, we use:
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const LoginScreen(),
                        transitionDuration: const Duration(milliseconds: 0)));
              });
            } else {
              // Prevent a redirection loop duruing the build phase of the app
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const HomeScreen(),
                        transitionDuration: const Duration(milliseconds: 0)));
              });
            }
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SpinKitCircle(
                  color: Colors.greenAccent,
                  size: 100,
                ),
                Text(
                  'Espere...',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  ),
                ),
              ],
            ));
          }),
    ));
  }
}
