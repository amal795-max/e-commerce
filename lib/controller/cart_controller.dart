import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController{
   List <dynamic>cartList=[];
   List <dynamic>favoriteList=[];
   int price=0;
   int quantity=0;

   plus(){
     quantity++;
   }
   minus(){
     if(quantity!=0)
     quantity--;
   }

  add(dynamic o){
     cartList.add(o);
    update();
  }

  remove(dynamic o){
    cartList.remove(o);
    update();
  }


  removeAll(){
    cartList.removeRange(0, cartList.length);
    update();

  }
}