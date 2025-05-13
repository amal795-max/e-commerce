import 'package:flutter/material.dart';
import '../../../core/constants/appcolor.dart';

class Circles extends StatelessWidget {
  final  int currentIndex;
  final  int length;
  const Circles({super.key, required this.length, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(length, (i) => Container(
            margin: const EdgeInsets.all(5),
            width:currentIndex==i ? 18 : 12,
            height: 12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: currentIndex==i ?AppColor.green :AppColor.lightGrey
            ),
          ),
        ),
      ],
    );
  }
}
