import 'package:e_commerce/view/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/screens/Cart.dart';
import '../view/screens/Favorite.dart';
import '../view/screens/Profile.dart';

class BottomAppBarController extends GetxController{
  int current=0;
  List<Widget>pages=[
    const Home(),
    const Cart(),
    const Favorite(),
     Profile()
  ];
  changePage(int currentIndex){
    current=currentIndex;
    update();

  }}