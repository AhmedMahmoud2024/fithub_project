import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/presentation/blocs/user_cubit.dart';

import '../../whatsapp_modified _version.dart';

class ModifiedLoginScreen extends StatelessWidget {
   ModifiedLoginScreen({super.key});
  final TextEditingController emailController=TextEditingController();
   final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(),
    body:Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
          Row(
            children: [
              Text("Don’t have an account",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 3,),
              Text("Create account",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Text("Email",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
          ),
          TextField(
            controller: emailController,
             decoration: InputDecoration(
               hintText: "Email",
             ),
          ),
          SizedBox(height: 8,),
          Text("Password",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(height: 20,),
          Text("forgot password",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
         SizedBox(height: 10,),
         BlocConsumer<UserCubit,UserState>(
              listener: (context,state){
                if(state.error!=null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.error!)));
                }
                if(state.user!=null){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChatListScreen(
                            userId: state.user!.uid, // Assuming UserEntity has an id field
                            userName: state.user!.uid,
                            userImage: state.user!.uid, // Assuming UserEntity has a profileImage field
                          ),
                    ),
                  );
                }
              }
             ,builder: (context,state){
                return state.isLoading? CircularProgressIndicator() :
                Container(
                  width: 1100,
                  child: ElevatedButton(
                      onPressed: (){
                    context.read<UserCubit>().signIn(
                        emailController.text,
                        passwordController.text
                    );
                  }, child: Text("Login")),
                );
         }
         ),

          SizedBox(height: 9,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(),
              Text("or",style: TextStyle(fontSize: 25),),
              Divider(),
            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){},
              child:Row(
                children: [
                  Icon(Icons.g_mobiledata_outlined),
                  Text("Sign in with google")
                ],
              )
          )
        ],
      ),
    ) ,
    );
  }
}
