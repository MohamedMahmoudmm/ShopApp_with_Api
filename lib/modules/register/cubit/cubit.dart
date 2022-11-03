import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/home_screen.dart';
import 'package:shopping_app/model/register/registermodel.dart';
import 'package:shopping_app/modules/register/cubit/states.dart';
import 'package:shopping_app/share/network/local/sheredprefrence.dart';
import 'package:shopping_app/share/network/remote/dio_helper.dart';

class ShopAppRegisterCubit extends Cubit<ShopAppRegisterStates>
{
  ShopAppRegisterCubit():super(ShopAppRegisterInitialState());
  static ShopAppRegisterCubit get(context)=>BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool showPassword=true;
  void changePasswordVisibility()
  {
    showPassword=!showPassword;
    suffix= showPassword?Icons.visibility:Icons.visibility_off;
    emit(RegisterShowPasswordState());

  }

  ShopRegisterModel? registermodel;
  void register({
    required BuildContext context,
    required String email,
    required String password,
    required String phone,
    required String name
})
  {
    DioHelper.postData(url: 'register',

        data: {
      'email':email,
          'password':password,
          'phone':phone,
          'name':name
    }).then((value) {

      registermodel =ShopRegisterModel.fromJson(value.data);

      print(registermodel!.msg);
      emit(RegisterSuccessState());
    }).catchError((error)
    {
      print('error '+error.toString());
      emit(RegisterErrorState());
    });
  }
}