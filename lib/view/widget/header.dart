import 'package:flutter/material.dart';

import '../../core/constants/appcolor.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 100),
          alignment: Alignment.topCenter,
          child:  Text(title, style: TextStyle(fontSize: 30)),
        ),
        Center(
          child: Text(
            subtitle,
            style: TextStyle(color: AppColor.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
