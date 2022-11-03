import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/layout/home_screen.dart';
import 'package:shopping_app/modules/login/cubit/cubit.dart';
import 'package:shopping_app/modules/login/cubit/states.dart';
import 'package:shopping_app/modules/register/register_screen.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
final formKey=GlobalKey<FormState>();
var emailController =TextEditingController();
   var passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ShopAppLoginCubit(),
      child: BlocConsumer<ShopAppLoginCubit,ShopAppLoginStates>(
        listener: (context,state){},
          builder: (context,state)
          {
            var loginCubit =ShopAppLoginCubit.get(context);
            return  SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80,),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Image(height: 55,
                          //       width: 47,
                          //
                          //       image: AssetImage('assets/image/Groupc.png')),
                          // ),
                          SizedBox(height: 100,),
                          Text('Login',
                            style: TextStyle(
                              fontSize:26,
                              color: Color(0xff181725),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 15,),

                          Text('Enter your emails and password',
                            style: TextStyle(
                              fontSize:16,
                              color: Color(0xff7C7C7C),
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 40,),
                          TextFormField(
                            controller: emailController,
                            cursorHeight: 25,
                            cursorColor: appColor,
                            decoration: InputDecoration(

                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C)
                                ),
                                //hintText: 'example@gmail.com',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                )

                            ),
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return " Enter Your Email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30,),
                          TextFormField(

                            controller: passwordController,
                            obscureText: loginCubit.showPassword,
                            cursorHeight: 25,
                            cursorColor: appColor,

                            decoration: InputDecoration(


                                labelText: 'password',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C)
                                ),
                                suffixIcon: IconButton(
                                  onPressed: ()
                                    {
                                      loginCubit.changePasswordVisibility();
                                    },
                                    icon: Icon(loginCubit.suffix)),

                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                )

                            ),
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return " Enter Your password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text('Forgot Password?',
                              style: TextStyle(fontSize: 14,color: Color(0xff181725)),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            height: 67,
                            width: double.infinity,
                            decoration: BoxDecoration(

                                color: appColor,
                                borderRadius: BorderRadius.circular(19)
                            ),
                            child: TextButton(
                              onPressed: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  loginCubit.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context);

                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context)=>HomeScreen())
                                  // );

                                }
                                // Fluttertoast.showToast(
                                //     msg:" loginModel!.msg",
                                //
                                //     toastLength: Toast.LENGTH_LONG,
                                //     gravity: ToastGravity.BOTTOM,
                                //     timeInSecForIosWeb:4,
                                //     backgroundColor: Colors.green,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0
                                // );



                              },
                              child: Text('Log In',
                                style: TextStyle(
                                  fontSize:18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don’t have an account?',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                              ),
                              TextButton(
                                onPressed: ()
                                {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                                },
                                child: Text('Singup',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: appColor,
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          ),

    );
  }
}
