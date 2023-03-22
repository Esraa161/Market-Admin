import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class notifications_screen extends StatelessWidget {
  List<String>title=["You have got new order, wanna\n check it now",
  "Status changed on order ID\n #545645 check it now",
    "You have got new order, wanna\n check it now",
    "Status changed on order ID\n #545645 check it now",
    "You have got new order, wanna\n check it now",
    "Status changed on order ID\n #545645 check it now",
    "You have got new order, wanna\n check it now",
    "Status changed on order ID\n #545645 check it now",
    "Status changed on order ID\n #545645 check it now",
    "Status changed on order ID\n #545645 check it now",
    "Status changed on order ID\n #545645 check it now",
    "Status changed on order ID\n #545645 check it now",
    "Status changed on order ID\n #545645 check it now",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF363537)),),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            // Image.asset("assets/images/Vector.png"),
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 24,bottom: 24,right: 16,left: 16),
        itemCount: title.length,
          itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Image.asset(
                      'assets/images/notification.png',
                      height: 48,
                      width: 49.6,
                      fit:BoxFit.fill

                  ),
                ),
                Container(
                  width: 231,
                  height:38 ,
                  padding: EdgeInsets.only(left: 16.4),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "${title[index]}",style:TextStyle(color: Colors.black87,fontSize: 16,),),
                )
              ],
            ),
          );
          }),
    );
  }
}
