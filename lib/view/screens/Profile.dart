import 'package:e_commerce/controller/cubit/logoutcubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/view/widget/CustomListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/darkmode.dart';
import '../../core/class/HeaderPainter.dart';
import '../../core/constants/approutes.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedLanguage = 'Option 1'; // State variable

  @override
  Widget build(BuildContext context) {
    Get.put(Dark());

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightOrange,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              CustomPaint(
                painter: HeaderPaint(),
                child: SizedBox(width: size.width, height: size.height / 4),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/avatar.jpg"),
                  ),
                ),
              ),
            ],
          ),
          const CustomListTile(
            title: "Account",
            iconData: Icons.account_circle_rounded,
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
          ),
          Divider(),
          // Language Expansion Tile
          ExpansionTile(
            leading: Icon(Icons.language, color: AppColor.orange),
            subtitle: const Text("Device Language (ar)"),
            title: const Text("App Language"),
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      enableFeedback: true,
                      title: const Text('Arabic'),
                      value: 'Option 1',
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('English'),
                      value: 'Option 2',
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          const CustomListTile(
            title: "Terms Of Use",
            iconData: Icons.privacy_tip_rounded,
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
          ),
          CustomListTile(
            title: "Privacy Policy",
            iconData: Icons.help,
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              Get.toNamed(AppRoutes.contents);
            },
          ),
          GetBuilder<Dark>(
            builder: (controller) {
              return CustomListTile(
                title: "Change Mode",
                subtitle: controller.value ? "Dark mode" : "Light mode",
                iconData: controller.value ? Icons.dark_mode : Icons.light_mode,
                trailing: Switch(
                  value: controller.value,
                  onChanged: (val) {
                    controller.on();
                    Get.changeTheme(controller.value ? ThemeData.dark() : ThemeData.light());
                  },
                  activeColor: Colors.green,
                ),
              );
            },
          ),
          Divider(),
          CustomListTile(
            title: "Logout",
            iconData: Icons.logout,
            onTap: () {
              Get.defaultDialog(
                title: "Alert",
                content: const Text("Are you sure you want to logout?"),
                confirm: TextButton(
                  onPressed: () {
                    context.read<LogoutCubit>().logout();
                  },
                  child: const Text("Yes"),
                ),
                cancel: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("No"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
