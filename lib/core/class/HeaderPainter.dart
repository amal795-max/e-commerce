import 'package:flutter/material.dart';

import '../constants/appcolor.dart';

class HeaderPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Shader gradient = LinearGradient(
      colors: [AppColor.deepOrange, AppColor.amber],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    Paint paint = Paint()..shader = gradient;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 1.44);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.9,size.width * 0.5, size.height * 0.90,);
    path.quadraticBezierTo(size.width * 0.80, size.height * 0.88, size.width, size.height * 0.69,);

    path.lineTo(size.width,0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
