import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("My Favorite"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: AppColor.black,))
        ],
      ),
      body:  ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Card(
                color: AppColor.lightGrey,
                child: ListTile(
                  leading: Image.asset("images/lenovo.png"),
                  title: const Text("laptop lenovo"),
                  subtitle: Text("500 \$",style: TextStyle(color: AppColor.orange),),
                  trailing: Icon(Icons.favorite,color: AppColor.red,),
                ),
              ),
            );
          },


        ),

    );
  }
}
