import 'package:e_commerce/core/constants/appimages.dart';
import 'package:flutter/material.dart';
import '../../core/constants/appcolor.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

        return SizedBox(
          width: 100,
          height: 100,
        //  child: context.read<SignUpCubit>().profile == null
            child:
               CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage:  AssetImage(AppImages.avatar),
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        border: Border.all(color: Colors.white, width: 2.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        // onTap: () {
                        //   ImagePicker().pickImage(source: ImageSource.gallery)
                        //       .then((value) => context.read<SignUpCubit>().uploadProfilePicture(value!));
                        // },
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

        );


  }
}
