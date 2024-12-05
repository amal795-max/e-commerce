import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';

class Contents extends StatelessWidget {
  const Contents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy",style:  TextStyle(color: AppColor.orange),)
      ),
    body: Container(
      margin: EdgeInsets.all(16),
      child: ListView(
        children: [
        
          Text(
             " Last Updated: 4 / 12 / 2024\n"
              "\n[e-commerce] ('we', 'our', or 'us') is committed to protecting your privacy."
              " This Privacy Policy explains how we collect, "
              "use, and share your personal information when you use our mobile application (e-commerce). "
               " By using the App, you agree to the terms outlined in this Privacy Policy."),
            SizedBox(height: 20),
       Text("1. Information We Collect :",style: TextStyle(color: AppColor.orange),)
          ,Text(
        " We may collect the following types of information:\n"
       "\na. Personal Information\n"
         " \n Name, email address, phone number, or any other information you provide directly to us.\n"
          " \nb. Device Information\n"
           "\nDevice type, operating system, unique device identifier, and other technical information.\n"
           "\nc. Usage Data\n"
         "  \nDetails about how you use the app, including features accessed, interaction time, and error reports.\n"
           "\nd. Location Data\n"
          " Approximate or precise location data (if you grant location permissions)"),

       SizedBox(height: 25,),
          Text("2. How We Use Your Information",style: TextStyle(color: AppColor.orange),),

          Text(
          " We use the collected information for the following purposes:\n"
           "\n* To provide, maintain, and improve the app's functionality.\n"
           "\n* To personalize your experience.\n"
           "\n* To communicate with you, including sending updates and notifications.\n"
          "\n* To monitor app performance and address technical issues.\n"
           " *To comply with legal obligations."),

          SizedBox(height: 20,),
          Text("3. Sharing Your Information",style: TextStyle(color: AppColor.orange),),

          Text(
           "   We do not sell or share your personal information with third parties, except:\n"
              "\n *With Your Consent: If you agree to share your information with specific third parties\n."
              "\n *For Service Providers: To trusted service providers who help us operate and manage the app\n"
              " (e.g., analytics or hosting providers).\n"
          "\n *For Legal Compliance: If required by law or to protect our legal rights.")
        ],
      ),
    ));
  }
}
