import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/cubit/cubit.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/model/homeModel/home_model.dart';
import 'package:shopping_app/modules/product/allproduct_screen.dart';
import 'package:shopping_app/modules/product/product_detail.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';

class MainProductScreen extends StatelessWidget {
  const MainProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: ( context,state){},
        builder: ( context,state)
        {
          var cubit=ShopAppCubit.get(context);
          return  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  // Image(height: 30,
                  //     width: 26,
                  //
                  //     image: AssetImage('assets/image/Groupc.png')
                  // ),
                  SizedBox(height: 9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_sharp,size: 20,color: Color(0xff4C4F4D),),
                      Text('Fayoum, Egypt',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4C4F4D),
                        ),
                      )
                    ],),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: Color(0xffF2F3F2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextFormField(
                        cursorHeight: 25,
                        cursorColor: appColor,
                        decoration: InputDecoration(

                            hintText: 'Search Store',
                            hintStyle: TextStyle( color: Color(0xff7C7C7C)),
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              size: 25,
                              color: Color(0xff181B19),
                            ),
                            border: InputBorder.none

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ConditionalBuilder(
                      condition: cubit.homeModel !=null,
                      builder: (context)=>Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              height: 130,
                              child:cubit.homeModel == null?Image(image: AssetImage('assets/image/banner.png'),):banners(cubit.homeModel!),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Exclusive Offer',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff181725),
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>AllProductScreen()));
                                },
                                child: Text('See all',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: appColor,
                                  ),
                                ),
                              )
                            ],),
                          SizedBox(height: 20,),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                childAspectRatio: 170/250,
                                mainAxisSpacing: 10,

                              ),
                              itemBuilder: (context,index)=>OfferItem(context, cubit.homeModel!.data!.product[index])
                          ),
                          // Container(
                          //   height: 250,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: ListView.separated(
                          //       //physics: NeverScrollableScrollPhysics(),
                          //         scrollDirection: Axis.horizontal,
                          //         itemBuilder: (context,index)=>OfferItem(context,cubit.homeModel!.data!.product[index]),
                          //         separatorBuilder: (context,index)=>SizedBox(width: 15,),
                          //         itemCount: 5),
                          //   ),
                          // ),
                          SizedBox(height: 20,),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Best Selling',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff181725),
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: (){},
                                child: Text('See all',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: appColor,
                                  ),
                                ),
                              )
                            ],),
                          SizedBox(height: 20,),
                          Container(
                            height: 250,
                            child: ListView.separated(
                              //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index)=>OfferItem(context, cubit.homeModel!.data!.product[index]),
                                separatorBuilder: (context,index)=>SizedBox(width: 15,),
                                itemCount: 4),
                          ),
                          SizedBox(height: 20,),
                          // Row(
                          //   //mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text('Groceries',
                          //       style: TextStyle(
                          //         fontSize: 24,
                          //         fontWeight: FontWeight.w600,
                          //         color: Color(0xff181725),
                          //       ),
                          //     ),
                          //     Spacer(),
                          //     TextButton(
                          //       onPressed: (){},
                          //       child: Text('See all',
                          //         style: TextStyle(
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w600,
                          //           color: appColor,
                          //         ),
                          //       ),
                          //     )
                          //   ],),
                          // SizedBox(height: 20,),

                          // Container(
                          //   height: 250,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: ListView.separated(
                          //       //physics: NeverScrollableScrollPhysics(),
                          //         scrollDirection: Axis.horizontal,
                          //         itemBuilder: (context,index)=>meatItem(),
                          //         separatorBuilder: (context,index)=>SizedBox(width: 15,),
                          //         itemCount: 10),
                          //   ),
                          // ),


                        ],
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator(),))
                ],
              ),
            ),
          );
        },
        );
  }
  Widget banners(HomeModel model)=>CarouselSlider(
      items:model.data!.banners
          .map((e) => Image(
          image: NetworkImage('${e.image}')
      )
      ).toList(),
      options: CarouselOptions(

          height: 130,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          scrollDirection: Axis.horizontal
      ));
  Widget OfferItem(var context,ProductsModel model)=>InkWell(
    onTap: (){
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context)=>ProductDetails(model)));
    },
    child: Stack(
      children: [
        Container(
          width: 170,
          height: 250,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Color(0xffE2E2E2),
                //color: Colors.black87,
                width: 1,

              )
          ),
          child:Padding(
            padding: EdgeInsets.all(15),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: NetworkImage(model.image!),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,

                    fontWeight: FontWeight.bold,
                    color: Color(0xff181725),
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${model.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff181725),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration
                        (
                          color: appColor,
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: IconButton(
                          onPressed: (){
                            ShopAppCubit.get(context).changeCart(model.id!);
                          },
                          icon: Icon(Icons.add,color: Colors.white,)),
                    )
                  ],),
              ],
            ),

          ),
        ),
        Positioned(
          top: 7,
          right: 7,
          child: IconButton(onPressed: (){
            ShopAppCubit.get(context).changeFavorites(model.id!);
          },
              //ShopAppCubit.get(context).test(model.id!))
              icon:ShopAppCubit.get(context).favorites[model.id]! ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,)) ,
        )
      ],
    ),
  );

}
