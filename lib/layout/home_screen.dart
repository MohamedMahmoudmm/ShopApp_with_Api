import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/cubit/cubit.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/modules/product/product_detail.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=>ShopAppCubit()..getHomeData()..getCategoriesData()..getFavorites()..getCart(),
      child: BlocConsumer<ShopAppCubit,ShopAppStates>(
          listener: (BuildContext context,ShopAppStates state){},
          builder: (BuildContext context,ShopAppStates state)
          {
            var cubit=ShopAppCubit.get(context);
            return SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xffffffff),
                //appBar: AppBar(),
                bottomNavigationBar: Container(
                  height: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  //spreadRadius: 0,
                  blurRadius:7,
                  offset: Offset(0, -12), // changes position of shadow
                ),
                ],
                  ),
                  child: BottomNavigationBar(
                    //selectedIconTheme: IconThemeData(),
                    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.black,
                    unselectedItemColor:appColor ,
                    currentIndex: cubit.currentIndex,
                    items: cubit.bottomItems,
                    onTap: (index)
                    {
                    cubit.changeBottomNavBar(index);
                    },
                  ),
                ),
                body: cubit.screens[cubit.currentIndex],
              ),
            );
          },
          ),

    );
  }
  

}
