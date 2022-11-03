import 'package:flutter/material.dart';
import 'package:shopping_app/share/componant/componant.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/image/right.png')),
              SizedBox(height: 60),
              Text('Your Order has been accepted',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff181725)),),
              SizedBox(height: 20),
              Text('Your items has been placcd and is on it’s way to being processed',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7c7c7c)),),
              Spacer(),
              button(
                  text: 'Track Order',
                function: ()
                {
                  print('hooo');
                }
              ),

              TextButton(
                onPressed: ()
                {
                  Navigator.pop(context);

                },
                child: Text('Back To Home',
                  style: TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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
