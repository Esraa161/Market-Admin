import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/components.dart';

class search_Screen extends StatelessWidget {
  const search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();}
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF363537)),),
          centerTitle: true,
          // automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),
              // Image.asset("assets/images/Vector.png"),
              onPressed: () {
                Navigator.pop(context);
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
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
                    hintText: 'Search order ID , client name ',
                    hintStyle: TextStyle(color:Colors.grey,fontSize:15,),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                        topEnd:Radius.circular(10),
                          bottomEnd:Radius.circular(10),

                        ),
                        color: Color(0xFFF2D3D4),
                      ),
                        child: Icon(Icons.search,color: Color(0xFFF5504C),)),
                ),

              ),
            ),
            Expanded(
              
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 346,
                      width: 344,
                      margin: EdgeInsets.only(top: 16,left: 16,right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFFFFFF),
                        boxShadow:[
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.12),
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0, // Move to right 5  horizontally
                              5.0,
                              // Move to bottom 5 Vertically
                            ),
                          ),
                        ],

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0,right: 7.8,bottom:16.3 ),
                                  child: Image.asset("assets/images/Flat.png",
                                    width: 22.13,
                                    height: 21.75,
                                  ),
                                ),
                                cardText("Delivery Order"),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0,left: 16,bottom:16.3),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 94,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xFFA1B5D8)
                                      ),
                                      child: Text("Preparing",style:TextStyle(fontSize: 16,color: Colors.white),)),
                                ),

                              ],
                            ),
                            Container(
                              height: 144,
                              width: 312,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      cardText("Order ID"),
                                      Text("#8386829",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                    ],
                                  ),
                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      cardText(("Client Name")),
                                      Text("Mohamed Ahmed",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                    ],),
                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      cardText(("Payment Method")),
                                      Text("Visa",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                    ],),
                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      cardText(("Driver Name")),
                                      Text("Not Selected",style:TextStyle(fontSize: 14,
                                          color: Color(0xFFFF4B52)
                                        /*    foreground: Paint()
                                      ..shader=ui.Gradient.linear(
                                        const Offset(0, 20),
                                        const Offset(150, 20),
                                        <Color>[
                                          Colors.red,
                                          Colors.yellow,
                                        ],
                                      )*/
                                        /*  foreground: Paint()..shader = LinearGradient(
                                            colors: <Color>[
                                              Colors.grey,
                                              Colors.deepPurpleAccent,
                                              Colors.red
                                              //add more color here.
                                            ],
                                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))*/

                                      ),),

                                    ],),
                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      cardText(("Total")),
                                      Text("172.000 \$",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                    ],),
                                ],
                              ),

                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0,right: 7.8,bottom:16.3 ),
                                  child: Image.asset("assets/images/Mask group.png",
                                    width: 22.13,
                                    height: 21.75,
                                  ),
                                ),
                                Text("Order will be ready  in",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
                                Text("  10:00  ",style:TextStyle(fontSize: 14,color: Color(
                                    0xFF4579E1)),),
                                Text("min",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),




                              ],
                            ),
                            canceledButton("Canceled", 48, 312),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Driver not assigned yet",style:TextStyle(fontSize: 16,color: Color(0xFF999999)),),
                                  Text(" Assign Now",style:TextStyle(fontSize: 16,color: Color(0xFFF5504C),fontWeight: FontWeight.bold),),

                                ],
                              ),
                            )



                          ],
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
