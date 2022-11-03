import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/layout/cubit/cubit.dart';
import 'package:shopping_app/layout/cubit/states.dart';
import 'package:shopping_app/model/category_model/category_model.dart';
import 'package:shopping_app/model/searchmodel/searchmodel.dart';
import 'package:shopping_app/modules/product/allproduct_screen.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

  var product=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = ShopAppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:20 ,),
                Text('Find Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff181725),
                  ),),
                SizedBox(height: 20,),
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                      color: Color(0xffF2F3F2),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextFormField(

                    controller: product,

                    onChanged: (text)
                    {
                      cubit.search(product.text);

                      product.selection =
                          TextSelection.collapsed(offset: product.text.length);

                    },
                    cursorHeight: 25,
                    cursorColor: Colors.green,

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
                SizedBox(height:20 ,),
                if(product.text.isEmpty)
                  Expanded(child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      childAspectRatio: 170/200,
                      crossAxisSpacing: 15,
                      mainAxisSpacing:15,
                      //crossAxisSpacing: 10
                    ),
                    itemBuilder: (BuildContext context, int index) =>categoryBuild(cubit.categoriesModel!.data!.data[index]),
                    itemCount:cubit.categoriesModel!.data!.data.length ,
                  ),
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        childAspectRatio: 170/250,
                        crossAxisSpacing: 15,
                        mainAxisSpacing:15,

                        //crossAxisSpacing: 10
                      ),
                      itemBuilder: (context,index)=>searchProductItem(cubit.searchModel!.data!.product[index]),
                      itemCount: cubit.searchModel!.data!.product.length,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget categoryBuild(DataModel model)=> InkWell(
    onTap: (){
      // Navigator.of(context)
      //     .push(MaterialPageRoute(
      //     builder: (context)=>ProductDetails()));
    },
    child: Container(

      decoration: BoxDecoration(
          color: Color(0xfff0f8ff),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Color(0xff53B175),
            //color: Colors.black87,
            width: 1,

          )
      ),
      child:Padding(
        padding: EdgeInsets.all(10),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image(fit: BoxFit.cover,
                  image: NetworkImage(model.image!),

                ),
              ),
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.center,
              child: Text(model.name!,
                textAlign: TextAlign.center,
                style: TextStyle(

                  //overflow: TextOverflow.,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff181725),
                ),
              ),
            ),

          ],
        ),

      ),
    ),
  );
  Widget searchProductItem(SearchProductsModel model)=> InkWell(
    onTap: (){
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context)=>ProductDetails()));
    },
    child: Container(
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
            Expanded(
              child: Text(model.name.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff181725),
                ),
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
                      color: Color(0xff53B175),
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
  );
}

