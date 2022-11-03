import 'package:flutter/material.dart';
import 'package:shopping_app/model/homeModel/home_model.dart';
import 'dart:math' as math;

import 'package:shopping_app/share/componant/componant.dart';

class ProductDetails extends StatefulWidget {
  dynamic model;
  ProductDetails(dynamic model)
  {
     this.model=model;
  }

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var amount=1;
  var index=0;
  var rotate=2;
  var isVisable=false;
  List<Widget> heart=
  [
    Icon(
      Icons.favorite_border,
      size: 25,color:Color(0xff7c7c7c) ,),

    Icon(
      Icons.favorite,
      size: 25,color:Colors.red ,),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.0),
        ),


        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 340,
                color: Color(0xffE2E2E2),
                child: Image(fit: BoxFit.contain,
                  image: NetworkImage(widget.model!.image!),),),

                SizedBox(height: 25,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SingleChildScrollView(

                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Row(
                            children: [
                              Expanded(
                                child: Text(widget.model!.name!,overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff181725),
                                  ),
                                ),
                              ),
                              IconButton(onPressed: ()
                              {
                                setState((){

                                  if(index==0) {
                                    index = 1;

                                  }
                                  else if(index==1)
                                  {
                                    index=0;

                                  }
                                });
                              },
                                icon:heart[index]
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                    setState((){
                                      amount--;
                                    });
                                  },
                                  icon: Icon(Icons.minimize,size: 22,),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(color: Color(0xffE2E2E2))
                                ),
                                child: Center(
                                  child: Text('$amount',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              IconButton(
                                onPressed: (){
                                  setState((){
                                    amount++;
                                  });
                                },
                                icon: Icon(Icons.add,size: 22,color: Color(0xff53B175),),
                              ),
                              Spacer(),
                              Text('${widget.model!.price}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff181725),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Color(0xffE2E2E2),
                          ),
                          SizedBox(height: 18,),
                          Row(
                            children: [
                              Text('Product Detail',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff181725),
                                ),
                              ),
                              Spacer(),
                              RotatedBox(
                                quarterTurns: rotate,
                                child: IconButton(
                                  onPressed: (){
                                    setState((){

                                     if(rotate==2) {
                                        rotate = 3;
                                        isVisable=true;
                                      }
                                     else if(rotate==3)
                                     {
                                       rotate=2;
                                       isVisable=false;
                                     }
                                    });
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                                    size: 16,color:Color(0xff181725) ,),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Visibility(
                            visible: isVisable,
                            child: Text(widget.model!.name!,
                              style: TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.w600,
                                color: Color(0xff7c7c7c),
                              ),
                            ),
                          ),
                          SizedBox(height: 18,),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Color(0xffE2E2E2),
                          ),
                          SizedBox(height: 18,),
                          Row(
                            children: [
                              Text('Nutritions',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff181725),
                                ),
                              ),
                              Spacer(),
                              RotatedBox(
                                quarterTurns: 2,
                                child: Icon(Icons.arrow_back_ios_new_outlined,
                                  size: 16,color:Color(0xff181725) ,),
                              )
                            ],
                          ),
                          SizedBox(height: 18,),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Color(0xffE2E2E2),
                          ),
                          SizedBox(height: 18,),
                          Row(
                            children: [
                              Text('Review',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff181725),
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.star,size:15,color: Color(0xffF3603F),),
                              Icon(Icons.star,size:15,color: Color(0xffF3603F),),
                              Icon(Icons.star,size:15,color: Color(0xffF3603F),),
                              Icon(Icons.star,size:15,color: Color(0xffF3603F),),
                              Icon(Icons.star,size:15,color: Color(0xffF3603F),),
                              RotatedBox(
                                quarterTurns: 2,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                                    size: 16,color:Color(0xff181725) ,),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 100,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                child: button(text: 'Add To Basket',
                    function: (){print('detail');}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
