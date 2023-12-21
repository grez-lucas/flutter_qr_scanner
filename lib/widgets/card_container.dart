import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: _createCardShape(),
      child: this.child,
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ]);
  }
}
