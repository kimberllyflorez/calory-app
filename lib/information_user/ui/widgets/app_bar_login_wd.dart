import 'package:flutter/material.dart';
class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.white30,
      color: Colors.white12,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const ColorBox(),
          Positioned(
            child: const IconPerson(),
            top: size.height * 0.05,
            left: size.height * 0.05,
            right: size.height * 0.05,
          ),
          child,
        ],
      ),
    );
  }
}

class IconPerson extends StatelessWidget {
  const IconPerson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30),
      child: const Icon(
        Icons.person_pin,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4ECDC4),
            Color(0xFF556270),
          ],
        ),
      ),
    );
  }
}
