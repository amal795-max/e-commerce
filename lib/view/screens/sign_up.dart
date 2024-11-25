import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:e_commerce/view/widget/PickImageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
        body: SizedBox.expand(
    child: Stack(
      alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.only(top: 55),
              width: double.infinity,
              child: Text("Sign Up",style: TextStyle(fontSize: 30,color: Colors.black54),),
          alignment: Alignment.topCenter,
          height: size.height/2.2,
        decoration: BoxDecoration(
        color: AppColor.blue,
          
        ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 150,horizontal: 20),
              child: BlurryContainer(
                blur: 8,
                elevation: 10,
                height: size.height/1.6,
                padding: const EdgeInsets.all(32),
                color: Colors.white.withOpacity(0.6),
                child: SingleChildScrollView(

                  child:  Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    PickImageWidget(),

                     const SizedBox(height: 20,),
                      SizedBox(
                        height: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(

                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: "phone number",
                            labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                            floatingLabelStyle: TextStyle(fontSize: 12, color: Colors.black), // For floating label
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),

                      ),
                      SizedBox(height: 15),

                      SizedBox(
                        height: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)
                            ), focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                            labelText: "password" ,
                              labelStyle: TextStyle(fontSize: 12),
                            floatingLabelStyle: TextStyle(fontSize: 12, color: Colors.black), // For floating label


                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),

                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)
                            ), focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                            labelStyle: TextStyle(fontSize: 12),
                            labelText: "confirm password" ,
                            floatingLabelStyle: TextStyle(fontSize: 12, color: Colors.black), // For floating label

                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      SizedBox(
                        height: 55,
                        child: TextField(

                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_pin),

                              filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)
                            ), focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                            labelText: "Location" ,
                              labelStyle: TextStyle(fontSize: 12),
                            floatingLabelStyle: TextStyle(fontSize: 12, color: Colors.black), // For floating label


                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 125,
              child: CupertinoButton(
                  color: AppColor.blue,
                  child: Text("Register"), onPressed: (){}),
            ) , Positioned(
              bottom: 70,
              child: Row(
                children: [
                  Text("already have an acount ? ",style: TextStyle(color: AppColor.grey),),
                  Text("Sign in",style: TextStyle(color: AppColor.blue),)
                ],
              )
            )
    ])));
  }
}
