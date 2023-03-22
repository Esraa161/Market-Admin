import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_admin/Update%20Password/Update%20Password%20Cubit/updatePassword_cubit.dart';
import 'package:market_admin/Update%20Password/Update%20Password%20Cubit/updatePassword_states.dart';
import 'package:market_admin/presentation/screens/login/login_screen.dart';
import '../../widgets/botton_widget.dart';
import '../../widgets/components.dart';
class forgetPassward2 extends StatefulWidget {
  final String email;
  forgetPassward2(this.email);
  //forgetPassward2({Key? key, required this.email}) : super(key: key);
   //final String emailController;
  @override
  State<forgetPassward2> createState() => _forgetPassward2State();
}

class _forgetPassward2State extends State<forgetPassward2> {

  final formKey = GlobalKey<FormState>();
  //var emailController='medof613@gmail.com';
  String _password = '';
  String ?_confirmPassword = '';
  var textController=TextEditingController();
  var  textControllerConfirm =TextEditingController();
  bool _passwordVisible= true;


  @override
  Widget build(BuildContext context){
    return BlocConsumer<updatePasswordCubit, updatePasswordState> (
      listener: (context, state){
        if (state is updatePasswordSuccessState) {
          if (state.updatePasswordModel.success==true) {
            print("hello this is testin ::::: ${state.updatePasswordModel.success}");
            final snackBar = SnackBar(
                content: Text('Submitting form'));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>
                    login_screen()));
          } else {
            Fluttertoast.showToast(msg: state.updatePasswordModel.message,backgroundColor: Colors.red);
          }
        }
      },
      builder: (context, state){
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
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SafeArea(
                child:SingleChildScrollView(
                  child: Form(
                    key:formKey,
                    child: Center(
                      child:  Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height/13,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/10,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  title2B("Create New Password"),
                                  smallestFont("Your new password must be diffrent from\n                 previous used password")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/30,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              margin: EdgeInsets.only(top:15,bottom:8),
                              child:TextFormField(
                                controller: textController,
                                obscureText: _passwordVisible,
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
                                  fillColor: Colors.transparent,
                                  prefixIcon:Image.asset("assets/images/key 2.png"),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color:Colors.grey,fontSize:15,),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black87,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]')
                                          .hasMatch(value)) {
                                    return "Enter Correct Password";
                                  } if(value.length<8){
                                    return"This Passward is short";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              )
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              margin: EdgeInsets.only(top:15,bottom:8),
                              child:TextFormField(
                                controller: textControllerConfirm,
                                obscureText: _passwordVisible,
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
                                  fillColor: Colors.transparent,
                                  prefixIcon:Image.asset("assets/images/key 2.png"),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color:Colors.grey,fontSize:15,),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black87,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]')
                                          .hasMatch(value)) {
                                    return "Enter Correct Password";
                                  } if(value.length<8){
                                    return"This Passward is short";
                                  }
                                  if(textController.text!=textControllerConfirm.text){
                                    return "Passward Is not Match";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              )
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/25,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/2.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ConditionalBuilder(
                                  condition:state is!updatePasswordLoadingState ,
                                  builder: (context)=>InkWell(
                                      onTap:(){if(formKey.currentState!.validate()){
                                        final snackBar=SnackBar(content: Text('Submitting form'));
                                        updatePasswordCubit.get(context).update_Password(
                                            email:widget.email,
                                        password:textController .text,
                                        password_confirmation:textControllerConfirm.text );
                                       /* Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_screen()));*/}
                                      },
                                      child: botton_widget("Send email")),
                                  fallback:(context)=> Center(child: CircularProgressIndicator()),
                                ),

                                Spacer(),
                                Container(
                                  height: MediaQuery.of(context).size.height/15,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: (){
                                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_screen()));
                                            },
                                            child: smallestFont("Did not recive email address?")),
                                        InkWell(
                                            onTap: (){
                                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => reset_password()));
                                            },
                                            child: smallestFont2B("try another mail address")),
                                      ],
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        );
      }
    );
  }
}
