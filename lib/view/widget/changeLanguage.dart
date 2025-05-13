import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/appColor.dart';
import '../../core/localization/local.dart';

class ChangeLanguage extends GetView<Localization>  {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return   ExpansionTile(
      leading: Icon(Icons.language, color: AppColor.orange),
      subtitle:  Text(controller.selectedLanguage=='Option 1'?"Device Language".tr:"Language".tr),
      title:  Text("App Language".tr),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RadioListTile(
                title:  Text('arabic'.tr),
                activeColor: AppColor.green,
                value: 'Option 1',
                groupValue: controller.selectedLanguage,
                onChanged: (value) {
                  controller.selectedLanguage=value!;
                  controller.changeLanguage('ar');
                },
              ),
              RadioListTile(
                title:  Text('english'.tr),
                activeColor: AppColor.green,
                value: 'Option 2',
                groupValue: controller.selectedLanguage,
                onChanged: (value) {
                  controller.selectedLanguage=value!;
                  controller.changeLanguage('en');

                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
