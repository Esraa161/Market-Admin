import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_admin/Reset%20Password/Forget%20Password%20Cubit/forgetPasswod_cubit.dart';
import 'package:market_admin/Reset%20Password/Forget%20Password%20Cubit/forgetPassword_states.dart';
import 'package:market_admin/presentation/screens/forgetPassward1.dart';
import 'package:market_admin/presentation/screens/login/login_screen.dart';
import '../widgets/botton_widget.dart';

class reset_password extends StatefulWidget {

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  final formKey = GlobalKey<FormState>();
   final emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<forgetPasswordCubit, forgetPasswordState>(
      listener:(context, state) {
        if (state is forgetPasswordSuccessState) {
          if (state.forgetPasswordModel.success==true) {
            print("hello this is testin ::::: ${state.forgetPasswordModel.success}");
            final snackBar = SnackBar(
                content: Text('Submitting form'));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>
                    forgetPassward1( emailController.text)));
          } else {
            Fluttertoast.showToast(msg: state.forgetPasswordModel.message!,backgroundColor: Colors.red);
          }
        }
      },
      builder: (context, state)
    {
      return GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();}
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Reset Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(
                0xFF363537)),),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height/40,
                          ),
                          Text("Reset Password",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(
                                0xFF363537)),),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Enter the email associated with your account\n  and we’ll send an email with instructions to\n                     reset your password",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(
                                  0xFF707070)),),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              margin: EdgeInsets.only(top:15,bottom:8),
                              child:TextFormField(
                                controller: emailController,
                                decoration:InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF2F5F7),
                                        width: 1.0,),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF2F5F7),
                                        width: 2.0,
                                      ),),
                                    fillColor: Color(0xFFF2F5F7),
                                    prefixIcon:Image.asset("assets/images/envelope 2.png"),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color:Colors.grey,fontSize:15,)
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty || /*RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)||*/
                                      !RegExp(r'^[\w-\.]+@gmail.com').hasMatch(value)) {
                                    return "Enter Correct email";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              )
                          ),
                          ConditionalBuilder(
                            condition:state is!forgetPasswordLoadingState ,
                            builder: (context)=>InkWell(
                                onTap: (){
                                  if(formKey.currentState!.validate()){
                                    forgetPasswordCubit.get(context).forget_Password(
                                        email:emailController.text );
                                   /* final snackBar=SnackBar(content: Text('Submitting form'));
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => forgetPassward1()));
                                */
                                  }
                                },
                                child: botton_widget("Send email")),
                            fallback:(context)=> Center(child: CircularProgressIndicator()),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: 204,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_screen()));
                      },
                      child: Text("I remember my password return to login",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(
                            0xFF363537)),),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Text("I dont have an account?",
                        style: TextStyle(fontSize: 16,color: Color(
                            0xFF707070)),),
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height/25,
                    )


                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    );
  }
  }

