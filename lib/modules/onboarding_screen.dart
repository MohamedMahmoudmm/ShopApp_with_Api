import 'package:flutter/material.dart';
import 'package:shopping_app/modules/login/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(

        children: [
          Image(
              height: double.infinity,
              fit: BoxFit.fitHeight,

              image: AssetImage('assets/image/person.jpg')
              //NetworkImage('https://s3-alpha-sig.figma.com/img/65e9/1e96/4e8f13cbdb37604e351d37d72a1eb837?Expires=1666569600&Signature=aZoU25E-CBGArQwqdky1HUp5BtaXFQ7oEB9iF84L95AMTOH~5lxSHt2YeKsS1j-BVJyShgZtnxLpaXgk7a1L3xUXyNw2ChrhSEi4zxrBqf2GLpP~eUQBxXXl9CKrm0tIUyDp9oAKEGp5UGfiRxV9KvbiV9NSfcDjGIDfuEeFU7yEXhR4xpRB6s5YyXcWpP8afh-D-1-Q3zlJQIwUESjkR1FS0bbVYQv-abWLvZshp~m0KXQ-h0MXFq4nHeDytGzPRUqDji0XeVSgYieTuXGjX3ATE2h7n7qE1xWTR2pM82cSjmpoo7NPwbQ46hyMmoeWsx0OGBsVlGliFmnQ3R6OSg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 80.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(height: 55,
                      width: 54,

                      image: AssetImage('assets/image/Group.png')),
                  Text('welcome',
                    style: TextStyle(
                        fontSize:48,
                        color: Colors.white ,
                    ),
                  ),
                  Text('to our store',
                    style: TextStyle(
                      fontSize:48,
                      color: Colors.white,
                    ),
                  ),
                  //SizedBox(height: 19,),
                  Text('Ger your groceries in as fast as one hour',
                    style: TextStyle(
                        fontSize:16,
                        color: Color(0xffFCFCFC),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    height: 67,
                    width: double.infinity,
                    decoration: BoxDecoration(

                      color: Color(0xff53B175),
                      borderRadius: BorderRadius.circular(19)
                    ),
                    child: TextButton(
                      onPressed: ()
                      {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context)=>LoginScreen()));

                      },
                      child: Text('Get Started',
                        style: TextStyle(
                          fontSize:18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
