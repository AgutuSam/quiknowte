import 'package:flutter/material.dart';

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
    ..lineTo(0, 0)
    ..lineTo(size.width-40, 0)
    ..quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height/2)
    ..quadraticBezierTo(
        size.width, size.height - (size.height / 4), size.width-40, size.height)
    ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}