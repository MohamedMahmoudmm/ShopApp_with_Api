import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color( 0xff53B175) ,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(height: 60,
                width: 54,

                image: AssetImage('assets/image/Group.png')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('nectar',
                  style: TextStyle(
                    fontSize: 46,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,

                  ),
                ),
                SizedBox(height: 0,),
                Text('online groceriet',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 3,
                    color: Colors.white,

                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
