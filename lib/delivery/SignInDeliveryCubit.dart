
import 'package:e_commerce/controller/cubit/UserState.dart';
import 'package:e_commerce/controller/cubit/api/api_consumer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../core/services/services.dart';
import '../data/model/signinDelivery_model.dart';
import '../controller/cubit/api/endPoints.dart';
import '../controller/cubit/errors/ServerException.dart';

class DeliverySignInCubit extends Cubit<UserState>{
  DeliverySignInCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  MyServices myServices = Get.find();
  GlobalKey<FormState> signinKey=GlobalKey();
TextEditingController phone =TextEditingController();
TextEditingController password =TextEditingController();

  signIn()async{
    if(signinKey.currentState!.validate()){
    try{
      emit(DeliverySignInLoading());
    final response= await api.post(EndPoint.loginDelivery,data: {
      ApiKeys.phone :phone.text,
      ApiKeys.password :password.text,
    });
      DeliverySignInModel signInModel =DeliverySignInModel.fromJson(response);
      myServices.saveData(key: ApiKeys.token, value: signInModel.token);
      myServices.saveData(key: ApiKeys.name, value: signInModel.name);
      emit(DeliverySignInSuccess(message: signInModel.message));

    }
        on ServerException catch(e){
      emit(DeliverySignInFailure( error: e.errModel.error, ));

        }}
    else return null;
}}

