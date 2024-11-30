import 'package:e_commerce/core/constants/appcolor.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: 250,
            width: 200,
            child: GridTile(
                header: GridTileBar(
                  title: Text("laptop lenovo"),
                backgroundColor: AppColor.orange,
                ),
                footer: GridTileBar(
                  title: Text('500\$'),
                  backgroundColor: AppColor.grey,
                  trailing: Icon(Icons.favorite_border),

                ),
                child: Container(
                    color:AppColor.lightGrey,
                child: Image.asset("images/lenovo.png"),)),
          ),
        ),
      ),
    );
  }}
