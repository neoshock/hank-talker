import 'package:flutter/material.dart';

class CurvedBackground extends StatelessWidget {
  const CurvedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedBackgroundClipper(),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.33,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

class CurvedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // ignore: cascade_invocations
    path
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 4,
        size.height - 150,
        size.width / 2,
        size.height - 120,
      )
      ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height - 90,
        size.width,
        size.height - 210,
      )
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CurvedBackgroundClipper oldClipper) => false;
}
