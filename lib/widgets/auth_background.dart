import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.indigo,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          // const _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 80),
        width: double.infinity,
        child: Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ));
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: _PurpleBoxDecoration(),
        child: Stack(
          children: [
            Positioned(child: _Bubble(), top: 90, left: 30),
            Positioned(child: _Bubble(), top: -40, left: -30),
            Positioned(child: _Bubble(), top: -50, right: -20),
            Positioned(child: _Bubble(), bottom: -50, right: 20),
            Positioned(child: _Bubble(), bottom: 120, right: 20),
            Positioned(child: _Bubble(), bottom: -50, left: -20),
          ],
        ));
  }

  BoxDecoration _PurpleBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.greenAccent,
          Colors.green,
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.green.withOpacity(0.2),
        ));
  }
}
