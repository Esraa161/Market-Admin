import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class botton_widget extends StatelessWidget {
  String text;
  botton_widget(this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:MediaQuery.of(context).size.height/15,
      width: MediaQuery.of(context).size.width/1.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFF5504C),

      ),
      child: Text("$text",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
    );
  }
}
