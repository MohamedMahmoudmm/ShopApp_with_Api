import 'package:flutter/material.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';

Widget button({required String text, required Function? function()})=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
  child: Container(
    height: 67,
    width: double.infinity,
    decoration: BoxDecoration(

        color:appColor.withOpacity(1),
        borderRadius: BorderRadius.circular(19)
    ),
    child: TextButton(
      onPressed: function,
      child: Text(text,
        style: TextStyle(
          fontSize:18,
          color: Colors.white,
        ),
      ),
    ),
  ),
);