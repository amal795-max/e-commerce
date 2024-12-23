import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.all(100),
        color: Colors.white,
        child: Lottie.asset("lottie/loading.json"));
  }
}
