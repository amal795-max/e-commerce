import 'package:flutter/material.dart';

class GradientBall extends StatelessWidget {
  const GradientBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:140,
      width: 140,
      decoration:const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: [
              Colors.deepOrange, Colors.amber
            ]
        ),
      ),
    );
  }}