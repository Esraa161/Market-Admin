import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_admin/presentation/screens/login/login_screen.dart';
import 'package:market_admin/All%20Orders/newOrder_screen.dart';
import 'package:market_admin/presentation/screens/notifications_screen.dart';
import 'package:market_admin/presentation/screens/preparing_screen.dart';
import 'package:market_admin/presentation/screens/search_screen.dart';
import 'package:market_admin/Settings/settings_screen.dart';
import '../widgets/botton_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class allOrders_screen extends StatefulWidget {
  static const routeName = "allOrder_screen";

  @override
  State<allOrders_screen> createState() => _allOrders_screenState();
}

class _allOrders_screenState extends State<allOrders_screen> {
  String ? Order_status;

  List<Widget> tabsContent = [
    newOrder_screen(),
    preparing_screen(),
    preparing_screen(),
    preparing_screen(),
    preparing_screen(),
  ];
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        child: Container(
          height: 40,
          width: 112,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(242, 245, 247, 1.0),
          ),

          child: Text(AppLocalizations.of (context)!.ne_w,
            style: TextStyle(color: Colors.black87),),
        ),
      ),
      Tab(
        child: Container(
          height: 40,
          width: 112,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(242, 245, 247, 1.0),
          ),

          child: Text(AppLocalizations.of (context)!.preparing,
            style: TextStyle(color: Colors.black87),),
        ),
      ),
      Tab(
        child: Container(
          height: 40,
          width: 112,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(242, 245, 247, 1.0),
          ),

          child: Text(AppLocalizations.of (context)!.recived,
            style: TextStyle(color: Colors.black87),),
        ),
      ),
      Tab(
        child: Container(
          height:40,
          width: 112,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(242, 245, 247, 1.0),
          ),

          child: Text(AppLocalizations.of (context)!.completed,
            style: TextStyle(color: Colors.black87),),
        ),
      ),
      Tab(
        child: Container(
          height: 40,
          width: 112,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(242, 245, 247, 1.0),
          ),

          child: Text(AppLocalizations.of (context)!.all,
            style: TextStyle(color: Colors.black87),),
        ),
      ),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:
        AppBar(
          title: Text(AppLocalizations.of (context)!.all_orders,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF363537)),),
          centerTitle: true,
          // automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
           leading: Builder(
            builder: (context) => IconButton(
              icon: Image.asset("assets/images/Vector.png"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
           ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => search_Screen()));
                },
                  child: Icon(Icons.search,size: 30,color: Colors.black,)),
            ),
          ],
        ),
        drawer: Drawer(
          width: 270,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                child:(Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    child: Image.asset(
                        'assets/images/Screenshot 2023-02-28 144702.png',
                        height: 96,
                        width: 96,
                        fit:BoxFit.fill

                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(AppLocalizations.of (context)!.market_name,style: TextStyle( color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                ],
                ) ),

              ),

              ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => notifications_screen()));
                },
                leading:Image.asset("assets/images/bell 1.png"),
                title: Text(AppLocalizations.of (context)!.notifications,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => setting_screen()));
                },
                leading:Image.asset("assets/images/settings 2.png"),
                title: Text(AppLocalizations.of (context)!.settings,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ),
             SizedBox(
               height:MediaQuery.of(context).size.height/1.65,
             ),
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(right:15.0,left: 21),
                   child: Image.asset("assets/images/sign-out-alt 1.png",
                   width: 24,
                     height: 24,
                   ),
                 ),
                 InkWell(
                     onTap: (){
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_screen()));
                     },
                     child: Text(AppLocalizations.of (context)!.logout,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0XFF363537)),))
               ],
             )



             // Divider(color:grey,thickness: 1,),
            ],
          ),),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [

                   SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: [
                         Container(
                           padding: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height / 15,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10.0)),
                           child: TabBar(

                             isScrollable: true,
                             indicator: BoxDecoration(
                               color: Color.fromRGBO(242, 245, 247, 1.0),
                               borderRadius: BorderRadius.circular(10.0),
                             ),

                             labelColor: Colors.black87,
                             unselectedLabelColor: Color.fromRGBO(242, 245, 247, 1.0),
                             tabs:tabs
                           ),
                         ),
                       ],
                     ),
                   ),
                    InkWell(
                      onTap: (){
                      if (Theme.of(context).platform == TargetPlatform.iOS) {
                        showCupertinoModalPopup(
                          context: context,
                            builder:(buildContext){
                              return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xFFD2D2D2),
                                      ),
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      // color: Color(0xFFD2D2D2),
                                      height: 50,
                                      child: Text("Filter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(20),
                                        child:
                                        Row(children: [
                                          Image.asset("assets/images/shopping-bag (1) 1.png"),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Order status",style: TextStyle(color: Colors.black,fontSize: 18),),
                                          ),
                                        ],)),
                                    RadioListTile(
                                      controlAffinity: ListTileControlAffinity.trailing,
                                      title: Text("All"),
                                      activeColor: Color(0xFFF5504C),
                                      value: "All",
                                      groupValue: Order_status,
                                      onChanged: (value){
                                        setState(() {
                                          Order_status = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      controlAffinity: ListTileControlAffinity.trailing,
                                      title: Text("Pick up"),
                                      value: "Pick up",
                                      activeColor: Color(0xFFF5504C),
                                      groupValue: Order_status,
                                      onChanged: (value){
                                        setState(() {
                                          Order_status = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      controlAffinity: ListTileControlAffinity.trailing,
                                      title: Text("Delivery"),
                                      value: "Delivery",
                                      activeColor: Color(0xFFF5504C),
                                      groupValue: Order_status,
                                      onChanged: (value){
                                        setState(() {
                                          Order_status = value.toString();
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 20.0),
                                        child: botton_widget("Save"),
                                      ),
                                    )

                                  ],
                                );
                              });
                            });

                      }else{
                          showModalBottomSheet(context: context,
                             // backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              builder:(buildContext){
                               return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                 return Column(
                                   children: [
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10.0),
                                         color: Color(0xFFD2D2D2),
                                       ),
                                       alignment: Alignment.center,
                                       width: double.infinity,
                                      // color: Color(0xFFD2D2D2),
                                       height: 50,
                                       child: Text("Filter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                     ),
                                     Container(
                                         padding: EdgeInsets.all(20),
                                         child:
                                         Row(children: [
                                           Image.asset("assets/images/shopping-bag (1) 1.png"),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text("Order status",style: TextStyle(color: Colors.black,fontSize: 18),),
                                           ),
                                         ],)),
                                     RadioListTile(
                                       controlAffinity: ListTileControlAffinity.trailing,
                                       title: Text("All"),
                                       activeColor: Color(0xFFF5504C),
                                       value: "All",
                                       groupValue: Order_status,
                                       onChanged: (value){
                                         setState(() {
                                           Order_status = value.toString();
                                         });
                                       },
                                     ),
                                     RadioListTile(
                                       controlAffinity: ListTileControlAffinity.trailing,
                                       title: Text("Pick up"),
                                       value: "Pick up",
                                       activeColor: Color(0xFFF5504C),
                                       groupValue: Order_status,
                                       onChanged: (value){
                                         setState(() {
                                           Order_status = value.toString();
                                         });
                                       },
                                     ),
                                     RadioListTile(
                                       controlAffinity: ListTileControlAffinity.trailing,
                                       title: Text("Delivery"),
                                       value: "Delivery",
                                       activeColor: Color(0xFFF5504C),
                                       groupValue: Order_status,
                                       onChanged: (value){
                                         setState(() {
                                           Order_status = value.toString();
                                         });
                                       },
                                     ),
                                     Spacer(),
                                     InkWell(
                                       onTap: (){

                                       },
                                       child: Padding(
                                         padding: const EdgeInsets.only(bottom: 20.0),
                                         child: botton_widget("Save"),
                                       ),
                                     )

                                   ],
                                 );
                               });
                             });}
                        },

                      child: Container(
                        padding: EdgeInsets.only(bottom: 5,left: 16),
                          child: Image.asset("assets/images/Group 50.png",
                          height: 40,
                          width: 40,)
                      ),
                    ),

                  ],
                ),
              ),
           Expanded(child:
           TabBarView(
             children: tabsContent,
           ),) ],
          ),
        )
      ),
    );
  }
}
