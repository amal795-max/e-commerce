import 'dart:io';
import 'package:e_commerce/controller/cubit/signup_cubit.dart';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/cubit/UserState.dart';
class PickImageWidget extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;
  const PickImageWidget({super.key,required this.backgroundImage,});

  @override
  Widget build(BuildContext context) {
    final profile= context.read<SignUpCubit>().profilepic ;
    return BlocConsumer<SignUpCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 90,
          height: 90,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage:profile==null?backgroundImage:FileImage(
                File(context.read<SignUpCubit>().profilepic!.path)),
            child: Stack(
              children: [
                Positioned(
                    bottom: 2,
                    right: 2,
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColor.green,
                          border: Border.all(color: AppColor.white, width: 3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              context.read<SignUpCubit>().uploadProfilePictureee(image);
                            } else {
                              print("No image selected");
                            }
                          },

                          child:  Icon(
                            Icons.camera_alt_sharp,
                            color:AppColor.white,
                            size: 20,
                          ),
                        ),
                      ),))
                     ],
                     ),

                 )

        );
      },
    );
  }}