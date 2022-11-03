import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/model/category_model/category_model.dart';
import 'package:shopping_app/model/changeFavorites/changeFavorits_model.dart';
import 'package:shopping_app/model/changecart/changecart_model.dart';
import 'package:shopping_app/model/gatFavoritesmodel/getFavorits_model.dart';
import 'package:shopping_app/model/getCart/getcart_model.dart';
import 'package:shopping_app/model/homeModel/home_model.dart';
import 'package:shopping_app/model/login_model/login_model.dart';
import 'package:shopping_app/model/searchmodel/searchmodel.dart';
import 'package:shopping_app/modules/account/account_screen.dart';
import 'package:shopping_app/modules/cart/cart_screen.dart';
import 'package:shopping_app/modules/explore/Search_screen.dart';
import 'package:shopping_app/modules/favourite/favourite_screen.dart';
import 'package:shopping_app/modules/product/mainproduct_screen.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';
import 'package:shopping_app/share/network/local/sheredprefrence.dart';
//import 'package:http/http.dart' as http;
import 'package:shopping_app/share/network/remote/dio_helper.dart';

class ShopAppCubit extends Cubit<ShopAppStates>
{
  ShopAppCubit():super(ShopAppInitialState());
  static ShopAppCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
        icon: Icon(Icons.storefront_sharp),
        label: 'shope'
    ),

    BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: 'Explore'
    ),

    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'cart'
    ),

    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Favourite'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_rounded),
        label: 'Account'
    ),

  ];
  List<Widget> screens=[
    MainProductScreen(),
    SearchScreen(),
    CartScreen(),
    FavouriteScreen(),
    AccountScreen()
  ];
//var list=[];
  void changeBottomNavBar(int index){
    currentIndex=index;
    emit(ChangeNavBarState());
  }
   HomeModel? homeModel;
  Map <int,bool> favorites={};
  Map <int,bool> cart={};

void getHomeData()
{
  emit(ShopAppLoadingState());
  DioHelper.getData(
      url: 'home',
      token: token
      ).then((value)
  {
    homeModel = HomeModel.fromJson(value.data);
    homeModel!.data!.product.forEach((element) {
      favorites.addAll(
       ( {
          element.id!:element.in_favorites!,
        })
      );
      cart.addAll(
          ( {
            element.id!:element.in_cart!,
          })
      );
    });

    emit(ShopAppGetSuccessHomeDataState());

  }).catchError((error)
  {
    print('error :'+error.toString());
    emit(ShopAppGetErrorHomeDataState());
  });
}

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(ShopAppLoadingState());
    DioHelper.getData(
        url: 'categories',
        token: token
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel!.data!.data[0].image);

      emit(ShopAppGetSuccessHomeDataState());
    }).catchError((error) {
      print('error :' + error.toString());
      emit(ShopAppGetErrorHomeDataState());
    });

  }
  ChangeFavoritesModel? favoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopAppChangeSuccessState());
    DioHelper.postData
      (
        url: 'favorites',
        token: token,
        data: {
          'product_id': productId
        }).then((value) {

      favoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(favoritesModel!.message);
      getFavorites();
      emit(ShopAppChangeFavSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopAppChangeFavErrorState());
    });
  }
  GetFavoritesModel? getFavorite;
  void getFavorites()
  {
    DioHelper.getData(
        url: 'favorites?',
      token: token
    ).then((value)
    {
      getFavorite=GetFavoritesModel.fromJson(value.data);
      emit(ShopAppGetFavSuccessState());

    }).catchError((error){
      print('555'+error.toString());

      emit(ShopAppGetFavErrorState());
    });

  }


  ChangeCartsModel? cartModel;

  void changeCart(int productId) {
    cart[productId] = !cart[productId]!;
    emit(ShopAppChangeFavSuccessState());
    DioHelper.postData
      (
        url: 'carts',
        token: token,
        data: {
          'product_id': productId
        }).then((value) {

      cartModel = ChangeCartsModel.fromJson(value.data);
      print(cartModel!.message);
      getCart();
      emit(ShopAppChangeCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopAppChangeCartErrorState());
    });
  }
  GetCartsModel? getCarts;
  void getCart()
  {
    DioHelper.getData(
        url: 'carts',
        token: token
    ).then((value)
    {
      getCarts=GetCartsModel.fromJson(value.data);
      emit(ShopAppGetCartSuccessState());

    }).catchError((error){

      emit(ShopAppGetCartErrorState());
    });

  }

  SearchModel? searchModel;

  void search(String text)
  {
    DioHelper.postData(
      token: token,
        lang: 'en',
        url: 'products/search',
        data: {
        'text':text
        }
    ).then((value)
    {

      searchModel=SearchModel.fromJson(value.data);
     // print(searchModel!.data!.product[0].name);
      emit(ShopAppSearchProductSuccessState());
    }).catchError((error)

    {
      print('rrrrrr'+error.toString());
      emit(ShopAppSearchProductErrorState());
    });
  }

Widget icon=Icon(Icons.favorite_border,);
  Widget test(int productId)
  {
    if(favorites[productId]!&&cart[productId]!)
      {
        icon=Icon(Icons.favorite_border,color: Colors.orange,);
      }
    if(!(favorites[productId]!&&cart[productId]!))
      {
        icon=Icon(Icons.favorite_border,);
      }
    if(favorites[productId]!&& !cart[productId]! )
    {
      icon=Icon(Icons.favorite_border,color: Colors.green,);
    }
    if(!favorites[productId]!&&cart[productId]!)
    {
      icon=Icon(Icons.favorite_border,color: Colors.blue,);
    }
    return icon;

  }

}