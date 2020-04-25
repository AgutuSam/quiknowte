import 'package:flutter/material.dart';

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
<<<<<<< HEAD
    final path = Path()
    ..lineTo(0, 0)
    ..lineTo(size.width-40, 0)
    ..quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height/2)
    ..quadraticBezierTo(
        size.width, size.height - (size.height / 4), size.width-40, size.height)
    ..lineTo(0, size.height);
=======
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width-40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height/2);
    path.quadraticBezierTo(
        size.width, size.height - (size.height / 4), size.width-40, size.height);
    path.lineTo(0, size.height);
>>>>>>> 2fd14d51bf4dfe49d25a156e3851656c8b1912dc
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}