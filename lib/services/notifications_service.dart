import 'package:flutter/material.dart';

class NotificationsService {
  // This class doesn't redraw anything, therefore it doesnt
  // Extend ChangeNotifier

  // This helps keep reference to the scaffold we'll be using
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar( String message ) {
    // Recieves a message and displays it as a snackbar

    final snackBar = SnackBar(content: Text(message, style:   TextStyle( color: Colors.white, fontSize: 20)), backgroundColor: Colors.greenAccent,);

    messengerKey.currentState!.showSnackBar(snackBar);
  }

}