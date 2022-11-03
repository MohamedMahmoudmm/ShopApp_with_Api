import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/layout/cubit/cubit.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/model/gatFavoritesmodel/getFavorits_model.dart';
import 'package:shopping_app/modules/product/product_detail.dart';
import 'package:shopping_app/share/componant/componant.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
        builder: (context,state)
        {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(

              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height:30 ,),
                      Text('Favourite',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff181725),
                        ),),
                      SizedBox(height: 30,),
                      Container(height: 1,color: Colors.grey,width: double.infinity,),
                      SizedBox(height: 20,),
                     ConditionalBuilder(
                         condition: ShopAppCubit.get(context).getFavorite != null,
                         builder: (context)=> Expanded(
                           child: ListView.separated(
                               shrinkWrap: true,
                               itemBuilder: (context,index)=>favoritesProduct(ShopAppCubit.get(context).getFavorite!.data!.data[index].product!,context),
                               separatorBuilder:  (context,index)=>Container(height: 1,color: Colors.grey,width: double.infinity,),
                               itemCount: ShopAppCubit.get(context).getFavorite!.data!.data.length),
                         ),
                         fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.black,),))
                    ],
                  ),
                  SizedBox(height: 100,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: button(text: 'Add All To Cart',
                        function: (){
                          print('favo');
                        }),
                  )
                ],
              ),
            ),
          );
        },
      );
  }
  Widget favoritesProduct(ProductFavoritesModel model,BuildContext context)=>Padding(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    child: Dismissible(


      key: UniqueKey(),
      onDismissed: (diraction)
      {
        ShopAppCubit.get(context).changeFavorites(model.id!);



      },

      child: InkWell(
        onTap: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context)=>ProductDetails(model)));
        },
        child: Container(
          height:75 ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(model.image!),
                ),
              ),

              SizedBox(width: 5,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(model.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff181725),
                        ),
                      ),
                    ),
                    SizedBox(height: 0,),
                    Text('${model.oldPrice!}',
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w600,
                        color: Color(0xff7c7c7c),
                      ),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),

              Text('${model.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff181725),
                ),
              ),
              IconButton(

                  onPressed: (){},
                  icon:Icon(Icons.arrow_forward_ios_outlined,size: 10,color: Color(0xff181725),))

            ],
          ),
        ),
      ),
    ),
  );
}