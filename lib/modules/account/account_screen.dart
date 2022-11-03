import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage('assets/image/mohamed.jpeg'),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Text('Mohamed Mahmoud',style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff171825),
                          fontWeight: FontWeight.bold
                        ),),
                        IconButton(onPressed: (){},
                            //padding: EdgeInsets.only(bottom: 0),
                            icon: Icon(Icons.mode_edit_outline_outlined,
                              size: 20,
                              color: Color(0xff53B175),))
                      ],
                    ),
                    Text('mm4574@fayoum.edu.eg',
                      style: TextStyle(
                          fontSize:16,
                          color:  Color(0xff7c7c7c),
                      ),)
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.shopping_bag_outlined,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('Orders',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.person_pin_outlined,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('My Details',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.location_on_outlined,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('Delivery Address',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.payment_rounded,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('Payment Methods',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.confirmation_number_outlined,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('Promo Code',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.notifications_none_sharp,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('Notification',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.help_outline,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('Help',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Row(children: [
              Icon(Icons.info_outline,
                size: 23,
                color:  Color(0xff171825),),
              SizedBox(width: 20,),
              Text('About',style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff171825),
                  fontWeight: FontWeight.w600
              ),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,
                size: 20,
                color:  Color(0xff171825),),
            ],),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(height: 1,width: double.infinity,color: Color(0xffE2E2E2),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
              child: Container(
                height: 67,
                width: double.infinity,
                decoration: BoxDecoration(

                    color: Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(19)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout,color: Color(0xff53B175),),
                      //Spacer(),
                      Expanded(
                        child: TextButton(
                          onPressed: ()
                          {
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(
                            //     builder: (context)=>LoginScreen()));

                          },
                          child: Text('Log Out',
                            style: TextStyle(
                              fontSize:18,
                              color:Color(0xff53B175),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    ),
    );
  }
}