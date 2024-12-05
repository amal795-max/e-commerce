import 'dart:io';
import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/signup_cubit.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 90,
          height: 90,
          child: context.read<SignUpCubit>().profile == null
              ? CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage("images/avatar.jpg"),
            child: Stack(
              children: [
                Positioned(
                  bottom: 3,
                  right: 3,
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
                        onTap: () {
                          ImagePicker().pickImage(source: ImageSource.gallery).
                          then((value) => context.read<SignUpCubit>().uploadProfilePicture(value!));
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
              : CircleAvatar(
            backgroundImage: FileImage(
                File(context.read<SignUpCubit>().profile!.path)),
          ),
        );
      },
    );
  }
}
