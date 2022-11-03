import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/cubit/cubit.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/model/homeModel/home_model.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopAppCubit()..getHomeData(),
      child: BlocConsumer<ShopAppCubit,ShopAppStates>(
        listener: (context,state){},
          builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(

              elevation: 0,
              title: Text('Exclusive Offers'),

              actions: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.filter_alt_outlined)
                )
              ],

            ),

            body: Center(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConditionalBuilder(
                  condition:  ShopAppCubit.get(context).homeModel !=null,
                  builder: (context)=>GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      childAspectRatio: 170/250,
                      crossAxisSpacing: 15,
                      mainAxisSpacing:15,

                      //crossAxisSpacing: 10
                    ),
                    itemBuilder: (context,index)=>productItem(context,ShopAppCubit.get(context).homeModel!.data!.product[index]),
                    itemCount: ShopAppCubit.get(context).homeModel?.data!.product.length,
                  ),
                  fallback: (context)=>CircularProgressIndicator()),

            ),),
          );
          },
         ),
    );
  }
  Widget productItem(var context,ProductsModel model)=> InkWell(
    onTap: (){
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context)=>ProductDetails()));
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
                // Text('355ml, Price',
                //   style: TextStyle(
                //     fontSize: 14,
                //     // fontWeight: FontWeight.w600,
                //     color: Color(0xff7c7c7c),
                //   ),
                // ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.price.toString(),
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
                          onPressed: (){},
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
          child: IconButton(onPressed: ()
          {
            ShopAppCubit.get(context).changeFavorites(model.id!);


          },
              icon: ShopAppCubit.get(context).favorites[model.id]! ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,)) ,
        )
      ],
    ),
  );
}
