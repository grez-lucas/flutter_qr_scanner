import 'package:flutter/material.dart';

class InputDecorations {
  // Only manages static properties so that we can easily get decorations

  static InputDecoration emailDecoration(BuildContext context) {
    return InputDecoration(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: "Email",
        icon:
            Icon(Icons.alternate_email, color: Theme.of(context).primaryColor));
  }

  static InputDecoration passwordDecoration(BuildContext context) {
    return InputDecoration(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: "Password",
        icon: Icon(Icons.lock_outline, color: Theme.of(context).primaryColor));
  }
}
