import 'package:e_commerce/controller/cubit/OrderCubit.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../core/constants/appColor.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().order();
    return BlocConsumer<OrderCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OrderSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Orders".tr),
            ),
            body: state.orders.isNotEmpty
                ? ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, i) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.lightGrey2,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "Order ${state.orders[i].order_id}".tr,
                          style: TextStyle(color: AppColor.orange),
                        ),
                        subtitle: Text(state.orders[i].created_at, style: TextStyle(fontSize: 12),),
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: state.orders[i].status == "confirmed" ? Colors.green.shade100
                                : state.orders[i].status == "processing" ? Colors.amber.shade200
                                : null,
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                state.orders[i].status == "confirmed" ? Icons.done_all
                                    : state.orders[i].status == "processing" ? Icons.hourglass_empty
                                    : null,
                              ),
                              SizedBox(width: 5),
                              Text(state.orders[i].status),
                            ],
                          ),
                        ),
                      ),
                      ...List.generate(
                        state.products.length, (j) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ListTile(
                subtitle  : Text(state.products[j].store_name),
                title: Text(state.products[j].name),
                                  ),
                                ),
                                Text("${state.products[j].quantity}"),
                                SizedBox(width: 50,),
                                Text("${state.products[j].price}  "),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(indent: 20, endIndent: 20),
                      ListTile(
                        title: Text("total price".tr),
                        trailing: Text(
                            "${state.orders[i].total_price_with_delivery}"),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                );
              },
            )
                : Center(child: Text("There are no orders")),
          );
        }
        return const Loading();
      },
    );
  }
}
