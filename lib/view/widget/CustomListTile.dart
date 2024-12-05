import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? iconData;
  final dynamic trailing;
  final void Function()? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    this.subtitle,
     this.iconData,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading:iconData!=null? Icon(iconData, color: AppColor.orange,):null,
      trailing: trailing,
    );
  }
}
