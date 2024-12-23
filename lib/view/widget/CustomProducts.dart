import 'package:flutter/material.dart';
import '../../core/constants/appColor.dart';
class CustomProducts extends StatelessWidget {
  final void Function()? onTap;
  final dynamic image;
  final String name;
  final String price;

  const CustomProducts({
    super.key,
    this.onTap,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {

          return InkWell(
            onTap:  onTap,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(image, height: 125),
                      SizedBox(height: 5),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColor.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        price,
                        style: TextStyle(color: AppColor.orange),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

  }
}
