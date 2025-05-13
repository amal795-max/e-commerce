
import 'package:flutter/material.dart';
import '../../core/constants/appColor.dart';

class CustomStores extends StatelessWidget {
  final void Function()? onTap;
  final String imageData;
  final String storeName;
  final String description;
  const CustomStores({super.key, this.onTap, required this.imageData, required this.storeName, required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(color: AppColor.lightGrey2, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                        child: Image.network(imageData)),
                    SizedBox(height: 5),
                    Text(storeName, style: TextStyle(color: AppColor.black),
                      maxLines: 2, overflow: TextOverflow.ellipsis,),
                    Text(description, style: TextStyle(color: AppColor.grey,fontSize: 12), maxLines: 3,
                      overflow: TextOverflow.ellipsis,),
                  ],),
              )
          )

    );
  }
}
