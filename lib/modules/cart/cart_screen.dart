import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/cubit/cubit.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/model/getCart/getcart_model.dart';
import 'package:shopping_app/modules/cart/successorder_screen.dart';
import 'package:shopping_app/share/componant/componant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
        builder: (context,state){

        var cubit=ShopAppCubit.get(context);
        return Padding(
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
                    Text('My Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff181725),
                      ),),
                    SizedBox(height: 30,),
                    Container(height: 1,color: Colors.grey,width: double.infinity,),
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context,index)=>cartProduct(cubit.getCarts!.data!.data[index].product!,context),
                          separatorBuilder:  (context,index)=>Container(height: 1,color: Colors.grey,width: double.infinity,),
                          itemCount: cubit.getCarts!.data!.data.length),
                    )
                  ],
                ),
                SizedBox(height: 100,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:button(text: 'Go to Checkout',
                      function: ()
                      {
                        showBottomSheet(
                            context: context,
                            builder:(context)=>Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                              ),


                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Checkout',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff181725),
                                          ),),
                                        Spacer(),
                                        IconButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            icon:Icon(
                                              Icons.highlight_remove_outlined,size: 30,
                                            )
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Container(height: 1,color: Color(0xffE2E2E2),width: double.infinity,),
                                    ),
                                    Row(
                                      children: [
                                        Text('Delivery',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff7c7c7c),
                                          ),),

                                        Spacer(),
                                        Text('Select Method',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff181725),
                                          ),),
                                        IconButton(
                                            onPressed: (){},
                                            icon:Icon(
                                              Icons.arrow_forward_ios_outlined,size: 15,
                                            )
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Container(height: 1,color: Color(0xffE2E2E2),width: double.infinity,),
                                    ),
                                    Row(
                                      children: [
                                        Text('Payment',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff7c7c7c),
                                          ),),

                                        Spacer(),

                                        IconButton(
                                            onPressed: (){},
                                            icon:Icon(
                                              Icons.arrow_forward_ios_outlined,size: 15,
                                            )
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Container(height: 1,color: Color(0xffE2E2E2),width: double.infinity,),
                                    ),
                                    Row(
                                      children: [
                                        Text('Promo Code',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff7c7c7c),
                                          ),),

                                        Spacer(),
                                        Text('pick discount',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff181725),
                                          ),),
                                        IconButton(
                                            onPressed: (){},
                                            icon:Icon(
                                              Icons.arrow_forward_ios_outlined,size: 15,
                                            )
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Container(height: 1,color: Color(0xffE2E2E2),width: double.infinity,),
                                    ),
                                    Row(
                                      children: [
                                        Text('Total Cost',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff7c7c7c),
                                          ),),

                                        Spacer(),
                                        Text('13.5',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff181725),
                                          ),),
                                        IconButton(
                                            onPressed: (){},
                                            icon:Icon(
                                              Icons.arrow_forward_ios_outlined,size: 15,
                                            )
                                        )
                                      ],
                                    ),
                                    button(text: 'Place Order',
                                        function:()
                                        {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context)=>SuccessOrderScreen()));})
                                  ],
                                ),
                              ),
                            )
                        );
                      }),
                )
              ],
            ),
          ),
        );
        },
       );
  }
  Widget cartProduct(ProductCartsModel model,BuildContext context)=>Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Container(
      height:90 ,
      child: Row(
        children: [
          Container(
            width: 100,
            child: Image(

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
                  child: Row(
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
                     
                      IconButton(
                        padding: EdgeInsets.only(bottom: 0),
                          onPressed: (){
                          ShopAppCubit.get(context).changeCart(model.id!);
                          },
                          icon: Icon(Icons.highlight_remove,color: Colors.grey,))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(

                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xffE2E2E2))
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: (){
                            // setState((){
                            //   amount++;
                            // });
                          },
                          icon: Icon(Icons.remove,size: 22,color: Color(0xffB3B3B3),),
                        ),
                      ),
                    ),
                    SizedBox(width:8,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(model.quantity==null?'0':model.quantity.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xffE2E2E2))
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: (){
                            // setState((){
                            //   amount++;
                            // });
                          },
                          icon: Icon(Icons.add,size: 22,color: Color(0xff53B175),),
                        ),
                    ),
                    ),
                    Spacer(),
                    Text(model.price.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff181725),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}