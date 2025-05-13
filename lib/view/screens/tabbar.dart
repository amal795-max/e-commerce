import 'package:e_commerce/data/data_source/SearchProduct.dart';
import 'package:e_commerce/view/widget/CustomTextField.dart';
import 'package:e_commerce/view/widget/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../controller/cubit/UserState.dart';
import '../../controller/cubit/getProductByIdCubit.dart';
import '../../controller/cubit/StoreWithProduct.dart';
import '../../core/constants/appColor.dart';
import '../../core/constants/approutes.dart';
import '../widget/CustomProducts.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  TabController? _controller; // Use nullable TabController
  Map<String, List> groupedProducts = {}; // Define globally

  @override
  void initState() {
    super.initState();
    context.read<StoreWithProductCubit>().product(); // Fetch products in initState
  }

  @override
  void dispose() {
    _controller?.dispose(); // Dispose of TabController
    super.dispose();
  }

  void _initializeTabController() {
    if (_controller != null) {
      _controller!.dispose(); // Dispose old controller
    }
    _controller = TabController(
      length: groupedProducts.entries.length,
      vsync: this,
    );
    setState(() {}); // Rebuild widget tree with new controller
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreWithProductCubit, UserState>(
      listener: (context, state) {
        if (state is GetProductSuccess) {
          groupedProducts.clear(); // Clear previous data
          for (var product in state.products) {
            if (!groupedProducts.containsKey(product.typeText)) {
              groupedProducts[product.typeText] = [];
            }
            groupedProducts[product.typeText]!.add(product);
          }
          _initializeTabController();
        }

      },
      builder: (context, state) {
        if (_controller != null) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              bottom: TabBar(
                controller: _controller,
                labelColor: AppColor.orange,
                indicatorColor: AppColor.orange,
                tabs: groupedProducts.entries.map((entry) => Tab(text: entry.key)).toList(),
              ),
              title:  SizedBox(
                height: 60,
                child:  CustomTextField(label: "Search on product".tr, icon: Icons.search,onTap: (){
                  showSearch(context: context, delegate: SearchProduct());}),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey2,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(onPressed: () {
                    Get.toNamed(AppRoutes.cart);
                  },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),
              ],
            ),
            body:  TabBarView(
                controller: _controller,
                children: groupedProducts.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: entry.value.length,
                      itemBuilder: (context, index) {
                        final product = entry.value[index];
                        return CustomProducts(
                          onTap: () {
                            Get.toNamed(AppRoutes.productDetails);
                            context.read<GetProductByIdCubit>().getProduct(product.id);
                          },

                          image: product.imageUrls.first,
                          price: "${product.price} \$",
                          name: product.name,
                        );
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                    ),
                  );
                }).toList(),
              ),
          );
        }
        return const Loading();
      },
    );
  }
}
