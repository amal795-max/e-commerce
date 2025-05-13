import 'package:flutter/material.dart';

import '../../core/constants/appcolor.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return
        Container(
          padding: const EdgeInsets.only(top: 100),
          alignment: Alignment.topCenter,
          child:  Column(
            children: [
              Text(title, style: TextStyle(fontSize: 30)),
              Text(subtitle, style: TextStyle(color: AppColor.grey, fontSize: 12),
              ),     ],
          ),


    );
  }
}


class Header2 extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header2({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.only(top: 25,left: 5),
        alignment: Alignment.center,
        child:  Column(
          children: [
            Text(title, style: TextStyle(fontSize: 30)),
            Text(subtitle, style: TextStyle(color: AppColor.grey, fontSize: 12),

            ),
          ],
        ),



      );
  }
}
