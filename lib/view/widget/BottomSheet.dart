import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Core/constants/appcolor.dart';
import '../../Core/constants/approutes.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/api/endPoints.dart';
import '../../controller/cubit/cartCubit.dart';
import '../../core/services/services.dart';
import 'CustomButton.dart';
import 'CustomListTile.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return BlocBuilder<CartCubit,UserState>(
    builder: (context,state){
    if (state is ShowCartSuccess) {
      return  Column(
        children:
        [
          const SizedBox(height: 15),
          ListTile(
            leading: Text(
                "delivery to".tr, style: TextStyle(color: AppColor.grey)),
            title: Text(myServices.getData(key: ApiKeys.location),
              style: TextStyle(color: AppColor.black),),
          ),
          const SizedBox(height: 15),
          CustomListTile(
            iconData: Icons.format_list_numbered,
            title: "item count".tr,
            trailing: Text("${state.total_items}"),
          ),
          CustomListTile(
            iconData: Icons.delivery_dining_outlined,
            title: "delivery cost".tr,
            trailing: Text("${state.total_delivery_charge} \$"),
          ),
          CustomListTile(
            iconData: Icons.attach_money,
            title: "tax".tr,
            trailing: Text("1.0 \$"),
          )
          , const Divider(indent: 15, endIndent: 15,)
          , CustomListTile(
          iconData: Icons.monetization_on_rounded,
          title: "total price".tr,
          trailing: Text(
              "${state.total_price + state.total_delivery_charge + 1} \$"),
        ),
          const SizedBox(height: 20),

          Row(
            children: [
              CustomButton(text: 'confirm order'.tr, onPressed: () {
                context.read<CartCubit>().confirmOrder();
                Get.offNamed(AppRoutes.order);
              }),
            ],
          )
        ],
      );
    }else return SizedBox();});}}
