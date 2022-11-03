import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/layout/home_screen.dart';
import 'package:shopping_app/model/login_model/login_model.dart';
import 'package:shopping_app/modules/login/cubit/states.dart';
import 'package:shopping_app/share/network/local/sheredprefrence.dart';
import 'package:shopping_app/share/network/remote/dio_helper.dart';

class ShopAppLoginCubit extends Cubit<ShopAppLoginStates>
{
  ShopAppLoginCubit():super(ShopAppInitialState());
  static ShopAppLoginCubit get(context)=>BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool showPassword=true;
  void changePasswordVisibility()
  {
    showPassword=!showPassword;
    suffix= showPassword?Icons.visibility:Icons.visibility_off;
    emit(LoginShowPasswordState());

  }

  void getApi()async
  {
    // print('api');
    // Uri url =Uri.parse('https://student.valuxapps.com/api/products');
    // http.Response response =await http.get(url);
    //
    // Map<String,dynamic> data = jsonDecode(response.body);
    // print(data);
  }
  ShopLoginModel? loginModel;
  void login({
    required BuildContext context,

    required String email,
    required String password
})
  {
    DioHelper.postData(url: 'login',

        data: {
      'email':email,
          'password':password
    }).then((value) {



      loginModel =ShopLoginModel.fromJson(value.data);

        CachHelper.saveData(
            key: 'token',
            value:loginModel!.data!.token);
      print(loginModel!.data!.token);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomeScreen())
      );





      emit(LoginSuccessState());
    }).catchError((error)
    {
      print('error '+error.toString());
      emit(LoginErrorState());
    });
  }
}