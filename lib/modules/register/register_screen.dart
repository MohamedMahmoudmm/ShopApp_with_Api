import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/modules/login/login_screen.dart';
import 'package:shopping_app/modules/register/cubit/cubit.dart';
import 'package:shopping_app/modules/register/cubit/states.dart';
import 'package:shopping_app/share/componant/constant/constant.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

   final formKey=GlobalKey<FormState>();
   var nameController =TextEditingController();
   var emailController =TextEditingController();
   var phoneController =TextEditingController();
   var passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ShopAppRegisterCubit(),
      child: BlocConsumer<ShopAppRegisterCubit,ShopAppRegisterStates>(
        listener: (context,state){},
          builder: (context,state)
          {
            var cubit=ShopAppRegisterCubit.get(context);
            return SafeArea(
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
                          SizedBox(height: 50,),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Image(height: 55,
                          //       width: 47,
                          //
                          //       image: AssetImage('assets/image/Groupc.png')),
                          // ),
                          SizedBox(height: 60,),
                          Text('Sign Up',
                            style: TextStyle(
                              fontSize:26,
                              color: Color(0xff181725),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 15,),

                          Text('Enter your credentials to continue',
                            style: TextStyle(
                              fontSize:16,
                              color: Color(0xff7C7C7C),
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            cursorHeight: 25,
                            controller: nameController,
                            cursorColor: appColor,
                            keyboardType: TextInputType.name,
                            validator: (name)
                            {
                              if(name!.isEmpty)
                                {
                                  return 'enter your name';
                                }
                              return null;
                            },
                            decoration: InputDecoration(

                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C)
                                ),
                                //hintText: 'example@gmail.com',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                )

                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: emailController,
                            cursorHeight: 25,
                            cursorColor: appColor,
                            keyboardType: TextInputType.emailAddress,
                            validator: (email)
                            {
                              if(email!.isEmpty)
                              {
                                return 'enter your email';
                              }
                              return null;
                            },
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
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: phoneController,
                            cursorHeight: 25,
                            cursorColor: appColor,
                            keyboardType: TextInputType.phone,
                            validator: (phone)
                            {
                              if(phone!.isEmpty)
                              {
                                return 'enter your phone';
                              }
                              return null;
                            },
                            decoration: InputDecoration(

                                labelText: 'Phone',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C)
                                ),
                                //hintText: 'example@gmail.com',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                )

                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: passwordController,
                            obscureText: cubit.showPassword,
                            cursorHeight: 25,
                            cursorColor: appColor,
                            validator: (password)
                            {
                              if(password!.isEmpty)
                              {
                                return 'enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(

                                labelText: 'password',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C)
                                ),
                                suffixIcon: IconButton(
                                  onPressed: ()
                                    {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(cubit.suffix)),

                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                )

                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text('By continuing you agree to our Terms of Service and Privacy Policy.',
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
                                    cubit.register(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                        name: nameController.text);

                                  }


                              },
                              child: Text('Sign Up',
                                style: TextStyle(
                                  fontSize:18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                              ),
                              TextButton(
                                onPressed: ()
                                {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                                },
                                child: Text('Login',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: appColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text('Don’t have an account?',
                          //       style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                          //     ),
                          //     TextButton(
                          //       onPressed: ()
                          //       {
                          //
                          //       },
                          //       child: Text('Singup',
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w600,
                          //           color: Color(0xff53B175),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // )

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
