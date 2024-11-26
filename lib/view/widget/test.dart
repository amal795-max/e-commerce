import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../../core/constants/gradientBall.dart';

class BlurContainerDemo extends StatelessWidget {
  const BlurContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                top: 50,
                left: 10,
                child: GradientBall(),
              ), Positioned(
                bottom: 30,
                right: 10,
                child: GradientBall()
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: BlurryContainer(
                  blur: 15,
                  height: size.height / 1.6,
                  elevation: 6,
                  padding: const EdgeInsets.all(32),
                  color: Colors.white.withOpacity(0.15),
                  child: SingleChildScrollView(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("images/avatar.png"),
                          child: Container(
                              child: IconButton(onPressed: () {},
                                  icon: Icon(Icons.camera_alt)),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle
                              )),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 55,
                          child: TextField(
                            //  enabled: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ), focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                              labelText: "phone number",
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        SizedBox(
                          height: 55,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ), focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                              labelText: "password",
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 55,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ), focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                              labelText: "confirm password",
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        SizedBox(
                          height: 55,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Location",
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
                    color: Colors.white,
                    child: Text(
                      "Register", style: TextStyle(color: AppColor.black),),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }}
