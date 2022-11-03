import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shopping_app/layout/home_screen.dart';
import 'package:shopping_app/modules/login/login_screen.dart';
import 'package:shopping_app/modules/register/register_screen.dart';

import 'package:shopping_app/share/componant/constant/constant.dart';
import 'package:shopping_app/share/network/local/sheredprefrence.dart';
import 'package:shopping_app/share/network/remote/dio_helper.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await DioHelper.init();
  await CachHelper.init();
    token=  CachHelper.getData(key: 'token');
   Widget widget;
   if(token !=null)
     {
       widget=HomeScreen();
     }
   else
     {
       widget=LoginScreen();
     }
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {

  final Widget? startWidget;

  const MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


theme: ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
      //secondary: Colors.black,
      primary: Colors.black54
    ),
  //cursorColor: appColor,

  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xff181725)),
    centerTitle: true,
      //elevation:2,
      backgroundColor: Colors.white,
    titleTextStyle: TextStyle(fontSize:20,color: Color(0xff181725),fontWeight: FontWeight.w600 )
  ),
    //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xff53B175))
),
      //home: SplashScreen(),

      home: startWidget
      //home: RegisterScreen(),
      //home: HomeScreen(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


