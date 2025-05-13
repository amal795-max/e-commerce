import 'dart:io';
import 'package:e_commerce/controller/cubit/signup_cubit.dart';
import 'package:e_commerce/core/constants/appColor.dart';
import 'package:e_commerce/core/constants/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/cubit/UserState.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 90,
          height: 90,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: context.read<SignUpCubit>().profilepic != null
                ? FileImage(File(context.read<SignUpCubit>().profilepic!.path)) as ImageProvider
                :  AssetImage(AppImages.avatar),
            child: Stack(
              children: [
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: () {
   ImagePicker().pickImage(source: ImageSource.gallery).then((value) =>
       context.read<SignUpCubit>().uploadProfilePictureee(value!));
                        },
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        );
      },
    );
  }
}
