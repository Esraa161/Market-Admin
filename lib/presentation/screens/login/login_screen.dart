import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_admin/All%20Orders/allOrders_screen.dart';
import 'package:market_admin/presentation/screens/login/cubit/cubit.dart';
import 'package:market_admin/presentation/screens/login/cubit/states.dart';
import 'package:market_admin/Reset%20Password/reset_password.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../widgets/botton_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';





class login_screen extends StatefulWidget {

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final formKey = GlobalKey<FormState>();
  final textController=TextEditingController();
  var emailController=TextEditingController();
  var  passwordController =TextEditingController();
  bool? check1 = false;
   bool _passwordVisible= true;
  String token = 'your_token_value_here';
  bool ?_isConnected=false;
 // bool isConnected = await InternetConnectionChecker().hasConnection;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();
 // ConnectivityCubit();
  }
  Future<bool> checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    return isConnected!;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<loginCubit, loginState>(
        listener: (context, state) async {
          if(state is loginSuccessState){
            if(state.loginModel.success==true){
              DioHelper.saveToken(token);
              Future<String> retrievedToken = DioHelper.getToken();
              print(state.loginModel.data!.token);
              final snackBar = SnackBar(
                  content: Text('Submitting form'));
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) =>
                      allOrders_screen()));
            }else{

           Fluttertoast.showToast(msg:state.loginModel.message! ,backgroundColor: Colors.red);

            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 7.41,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 4.69,
                            child: Image.asset(
                              "assets/images/Group 20351 (1).png",
                              fit: BoxFit.fill,
                              width: double.infinity,),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 20,
                          ),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 13,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text("Market Admin", style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),),
                                  Text("Easy Control Your Bussiness",
                                      style: TextStyle(
                                        fontSize: 14, color: Colors.grey,)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery
                              .of(context)
                              .size
                              .height / 40,),
                          Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.1,
                              margin: EdgeInsets.only(top: 15, bottom: 8),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
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
                                    prefixIcon: Image.asset(
                                        "assets/images/envelope 2.png"),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15,)
                                ),
                                validator: (String? value) {
                                  if (value!
                                      .isEmpty || /*RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)||*/
                                      !RegExp(r'^[\w-\.]+@gmail.com')
                                          .hasMatch(value)) {
                                    return "Enter Correct email";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              )
                          ),
                          Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.1,
                              margin: EdgeInsets.only(top: 15, bottom: 3),
                              child: TextFormField(
                                controller:passwordController ,
                                obscureText: _passwordVisible,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
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
                                  prefixIcon: Image.asset(
                                      "assets/images/key 2.png"),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15,),
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
                                  }
                                  if (value.length < 8) {
                                    return "This Passward is short";
                                  }
                                  else {
                                    return null;
                                  }
                                },

                              )
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 2, left: 5),
                                child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeColor: Colors.black87,
                                    value: check1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        check1 = value;
                                      });
                                    }
                                ),
                              ),
                              Text("Remember me",
                                  style: TextStyle(fontSize: 16, color: Color(
                                      0xFF707070),)),
                            ],
                          ),
                          SizedBox(height: MediaQuery
                              .of(context)
                              .size
                              .height / 45,),
                          ConditionalBuilder(
                            condition:state is!loginLoadingState ,
                            builder: (context)=>InkWell(
                              onTap: ()async {

                                if (formKey.currentState!.validate()) {
                                  _isConnected =await checkInternetConnection();
                                  if(_isConnected== false){
                                    Fluttertoast.showToast(msg:"No Internet ",backgroundColor: Colors.red);
                                  }else
                                  { loginInitialState();
                                    loginCubit.get(context).userLogin(
                                      email:emailController.text ,
                                      password: passwordController.text);}
                               }
                              },
                              child: botton_widget("Login"),
                            ),
                            fallback:(context)=> Center(child: CircularProgressIndicator()),
                          ),
                          InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>
                          reset_password()));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  child: Text("Forget Password?",
                    style: TextStyle(color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),),),
              ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 10,
                          )

                        ],
                      ),
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

