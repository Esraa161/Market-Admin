import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:market_admin/presentation/screens/login/login_screen.dart';
import 'package:market_admin/Reset%20Password/reset_password.dart';
import '../../Update Password/forgetPassward2.dart';
import '../../widgets/botton_widget.dart';
import '../../widgets/components.dart';
class forgetPassward1 extends StatelessWidget {
  final String email;
  forgetPassward1(this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(
            0xFF363537)),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child:ListView(
            children: [
              Container(
              height: MediaQuery.of(context).size.height/2.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Image.asset(
                        'assets/images/Screenshot 2023-02-25 140134.png',
                        width: 96,
                        height: 96,
                        fit:BoxFit.fill

                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/14,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [title2B('Check Your Mail'),
                          smallestFont("We have sent password recover mail"),],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => forgetPassward2(email)));
                    },
                      child: botton_widget("Reset Passward")),
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
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_screen()));
                            },
                              child: smallestFont("Did not recive email address?")),
                          InkWell(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => reset_password()));
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
          )

        ),
      ),
    );
  }
}
