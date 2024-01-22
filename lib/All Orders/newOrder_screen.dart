import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_admin/All%20Orders/AllOrders%20Cubit/allOrders_states.dart';
import '../presentation/screens/orderDetails_screen.dart';
import '../widgets/components.dart';
import 'AllOrders Cubit/allOrders_cubit.dart';
class newOrder_screen extends StatefulWidget {
  static const routeName = "newOrder_screen";

  @override
  State<newOrder_screen> createState() => _newOrder_screenState();
}

class _newOrder_screenState extends State<newOrder_screen> {
  @override
  void initState() {
    // TODO: implement initState
    allOrdersCubit.get(context).getallOrders();
    super.initState();
  }
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<allOrdersCubit, allOrdersState>(
        listener: (context, state) {},
    builder: (context, state) {
      return  RefreshIndicator(
      onRefresh: () async {
        allOrdersCubit.get(context).getallOrders();
      },
      child:ListView.builder(
        controller: _scrollController,
        itemCount: 10,
        //itemCount: state.allOrdersModel.data.length,
        itemBuilder:(context, index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => orderDetails_screen()));
            },
            child: Container(
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
                        cardText("Order"),
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
                              Text("113",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                            ],
                          ),
                          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cardText(("Client Name")),
                              Text("Esraa Emad",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                            ],),
                          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cardText(("Payment Method")),
                              Text("cash",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                            ],),
                          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cardText(("Driver Name")),
                              Text("Ahmed",style:TextStyle(fontSize: 14,
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
                              Text("30\$",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

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
          );
        } ,
      )
      // Scaffold(
      //   body:  BlocBuilder<allOrdersCubit,allOrdersState>(
      //     builder: (context, state) {
      //       if (state is allOrdersLoadingState){
      //         return Center(child: CircularProgressIndicator());
      //
      //       }
      //       else
      //         if(state is allOrdersSuccessState)
      //      {
      //        return ListView.builder(
      //          controller: _scrollController,
      //          itemCount: state.allOrdersModel.data.length,
      //          //itemCount: state.allOrdersModel.data.length,
      //          itemBuilder:(context, index){
      //            return InkWell(
      //              onTap: (){
      //                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => orderDetails_screen()));
      //              },
      //              child: Container(
      //                height: 346,
      //                width: 344,
      //                margin: EdgeInsets.only(top: 16,left: 16,right: 16),
      //                decoration: BoxDecoration(
      //                  borderRadius: BorderRadius.circular(10),
      //                  color: Color(0xFFFFFFFF),
      //                  boxShadow:[
      //                    BoxShadow(
      //                      color: Color.fromRGBO(0, 0, 0, 0.12),
      //                      blurRadius: 10.0, // soften the shadow
      //                      spreadRadius: 5.0, //extend the shadow
      //                      offset: Offset(
      //                        0, // Move to right 5  horizontally
      //                        5.0,
      //                        // Move to bottom 5 Vertically
      //                      ),
      //                    ),
      //                  ],
      //
      //                ),
      //                child: Padding(
      //                  padding: const EdgeInsets.only(left: 16.0,right: 16),
      //                  child: Column(
      //                    children: [
      //                      Row(
      //                        children: [
      //                          Padding(
      //                            padding: const EdgeInsets.only(top: 16.0,right: 7.8,bottom:16.3 ),
      //                            child: Image.asset("assets/images/Flat.png",
      //                              width: 22.13,
      //                              height: 21.75,
      //                            ),
      //                          ),
      //                          cardText("${state.allOrdersModel.data[index].receiveMethod} Order"),
      //                          Spacer(),
      //                          Padding(
      //                            padding: const EdgeInsets.only(top: 16.0,left: 16,bottom:16.3),
      //                            child: Container(
      //                                alignment: Alignment.center,
      //                                width: 94,
      //                                height: 24,
      //                                decoration: BoxDecoration(
      //                                    borderRadius: BorderRadius.circular(20),
      //                                    color: Color(0xFFA1B5D8)
      //                                ),
      //                                child: Text("Preparing",style:TextStyle(fontSize: 16,color: Colors.white),)),
      //                          ),
      //
      //                        ],
      //                      ),
      //                      Container(
      //                        height: 144,
      //                        width: 312,
      //                        child: Column(
      //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                          children: [
      //                            Row(
      //                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                              children: [
      //                                cardText("Order ID"),
      //                                 Text("${state.allOrdersModel.data[index].orderId}",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
      //
      //                              ],
      //                            ),
      //                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                              children: [
      //                                cardText(("Client Name")),
      //                                Text("${state.allOrdersModel.data[index].clientName}",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
      //
      //                              ],),
      //                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                              children: [
      //                                cardText(("Payment Method")),
      //                                Text("${state.allOrdersModel.data[index].paymentMethod}",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
      //
      //                              ],),
      //                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                              children: [
      //                                cardText(("Driver Name")),
      //                                Text("${state.allOrdersModel.data[index].driverName}",style:TextStyle(fontSize: 14,
      //                                    color: Color(0xFFFF4B52)
      //                                  /*    foreground: Paint()
      //                           ..shader=ui.Gradient.linear(
      //                             const Offset(0, 20),
      //                             const Offset(150, 20),
      //                             <Color>[
      //                               Colors.red,
      //                               Colors.yellow,
      //                             ],
      //                           )*/
      //                                  /*  foreground: Paint()..shader = LinearGradient(
      //                                 colors: <Color>[
      //                                   Colors.grey,
      //                                   Colors.deepPurpleAccent,
      //                                   Colors.red
      //                                   //add more color here.
      //                                 ],
      //                               ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))*/
      //
      //                                ),),
      //
      //                              ],),
      //                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                              children: [
      //                                cardText(("Total")),
      //                                Text("${state.allOrdersModel.data[index].total}\$",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
      //
      //                              ],),
      //                          ],
      //                        ),
      //
      //                      ),
      //                      Row(
      //                        children: [
      //                          Padding(
      //                            padding: const EdgeInsets.only(top: 16.0,right: 7.8,bottom:16.3 ),
      //                            child: Image.asset("assets/images/Mask group.png",
      //                              width: 22.13,
      //                              height: 21.75,
      //                            ),
      //                          ),
      //                          Text("Order will be ready  in",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
      //                          Text("  10:00  ",style:TextStyle(fontSize: 14,color: Color(
      //                              0xFF4579E1)),),
      //                          Text("min",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
      //
      //
      //
      //
      //                        ],
      //                      ),
      //                      canceledButton("Canceled", 48, 312),
      //                      Padding(
      //                        padding: const EdgeInsets.only(top: 8.0),
      //                        child: Row(
      //                          mainAxisAlignment: MainAxisAlignment.center,
      //                          children: [
      //                            Text("Driver not assigned yet",style:TextStyle(fontSize: 16,color: Color(0xFF999999)),),
      //                            Text(" Assign Now",style:TextStyle(fontSize: 16,color: Color(0xFFF5504C),fontWeight: FontWeight.bold),),
      //
      //                          ],
      //                        ),
      //                      )
      //
      //
      //
      //                    ],
      //                  ),
      //                ),
      //
      //              ),
      //            );
      //          } ,
      //        );
      //
      //      }else{
      //         return SizedBox();
      //       }
      //     }
      //     )
      //
      // ),
    );
    });

  }

}
