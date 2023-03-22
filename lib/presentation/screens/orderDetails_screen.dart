import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_admin/presentation/screens/search_screen.dart';
import '../../widgets/components.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:lottie/lottie.dart';
class orderDetails_screen extends StatefulWidget {
  @override
  State<orderDetails_screen> createState() => _orderDetails_screenState();
}

class _orderDetails_screenState extends State<orderDetails_screen> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  bool? check1 = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF363537)),),
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
      body:Column(
       // shrinkWrap: true,
        children: [
          Expanded(
            child: Container(
              
              child: SingleChildScrollView(
                child: Column(

                  children: [
                  Padding(
                    padding: EdgeInsets.only(top:24.0,right: 16,left: 16),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      trailing:Icon(Icons.arrow_drop_down_outlined),
                      iconColor:Colors.white,
                      title: Row(
                        children: [
                          Image.asset("assets/images/Vector2.png",
                            width: 21.3,
                            height: 24,),
                          appBaretitle("   Client Info."),

                        ],
                      ),
                      childrenPadding: EdgeInsets.all(5),
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height/7,
                          width: 312,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Client Name")),
                                  Text("Mohamed Ahmed",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Phone")),
                                  Text("01013616481",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Address")),
                                  Text("4 st. El-Salaam Maadi, cairo, Egypt",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),

                            ],
                          ),

                        ),
                      ],


                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16,left: 16),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      trailing:Icon(Icons.arrow_drop_down_outlined),
                      iconColor:Colors.white,
                      title: Row(
                        children: [
                          Image.asset("assets/images/shopping-bag (1) 1 (1).png",
                            width: 21.3,
                            height: 24,),
                          appBaretitle("   Order Info."),

                        ],
                      ),
                      childrenPadding: EdgeInsets.all(5),
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height/4,
                          width: 312,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Order Status")),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Order ID")),
                                  Text("#8386829",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Driver Name")),
                                  Text("Mohamed Hefen",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Order Type")),
                                  Text("Delivery",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Time")),
                                  Text("50 min",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Updated at")),
                                  Text("12/2/2022",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Notes")),
                                  Text("This is a test note for \n   talabatcom market \n               admin",
                                    style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),


                            ],
                          ),

                        ),
                      ],


                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16,left: 16),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      trailing:Icon(Icons.arrow_drop_down_outlined),
                      iconColor:Colors.white,
                      title: Row(
                        children: [
                          Image.asset("assets/images/Billing.png",
                            width: 21.3,
                            height: 24,),
                          appBaretitle("   Billing Info."),

                        ],
                      ),
                      childrenPadding: EdgeInsets.all(5),
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height/5,
                          width: 312,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Payment Method")),
                                  Text("Visa",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Subtotal")),
                                  Text("150.00 \$",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  cardText(("Delivery fee")),
                                  Text("5.00 \$",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                                ],),
                              Center(
                                child:   Divider(
                                  thickness: 0.5,
                                  indent: 5,
                                  // endIndent: 0,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  appBaretitle("Total"),
                                  appBaretitle("155.00 \$")

                                ],),

                            ],
                          ),

                        ),
                      ],


                    ),
                  ),
                ],),
              ),
            ),
          ),


         // Expanded(child: SizedBox()),
          Container(
            height:120 ,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
              topLeft: Radius.circular(20 )),
              color: Color(0xFFFFFFFF),
              boxShadow:[
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                  blurRadius: 20.0, // soften the shadow
                  spreadRadius: 20.0, //extend the shadow
                  offset: Offset(
                    -4, // Move to right 5  horizontally
                    10.0,
                    // Move to bottom 5 Vertically
                  ),
                ),
              ],

            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
              Lottie.asset("assets/images/12716-error.json",
                      height: 30,
                      width: 30,),
                      Text("Order will be ready  in",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),
                      Text("  1 :00  ",style:TextStyle(fontSize: 14,color: Color(
                          0xFF4579E1)),),
                      Text("min",style:TextStyle(fontSize: 14,color: Color(0xFF999999)),),

                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            Alert(
                                context: context,
                                image: Image.asset("assets/images/Group 114.png",
                                 // height: 100,
                                  width: 48,),
                                content: Column(
                                  children: <Widget>[
                                    Text("Choose Time",
                                        style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
                                    Text("Select which driver you want to",
                                        style:TextStyle(color: Colors.black87,fontSize: 16,)),
                                    Text("assign to this order",
                                        style:TextStyle(color: Colors.black87,fontSize: 16,)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 60,
                                          child: TextFormField(
                                            maxLength: 2,
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
                                              hintText: '00',
                                              hintStyle: TextStyle(color:Colors.grey,fontSize:24,),

                                            ),
                                          ),
                                        ),
                                        Text(":",style: TextStyle(color: Colors.black,fontSize: 24),),
                                        Container(
                                          height: 70,
                                          width: 60,
                                          child: TextFormField(
                                            maxLength: 2,
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
                                              hintText: '00',
                                              hintStyle: TextStyle(color:Colors.grey,fontSize:24,),

                                            ),
                                          ),
                                        ),
                                        Text("Min",style: TextStyle(color: Colors.black,fontSize: 15),),
                                      ],
                                    )
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () {
                                      /* Alert(
                context: context,
                image: Image.asset("assets/images/Driver.png",
                  width: 48,
                  height: 48,),
                content: Column(
                  children: <Widget>[
                    Text("Choose Driver",
                        style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
                    Text("Select which driver you want to",
                        style:TextStyle(color: Colors.black87,fontSize: 16,)),
                    Text("assign to this order",
                        style:TextStyle(color: Colors.black87,fontSize: 16,)),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        minLines: 4,
                        maxLines: 4,
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
                          hintText: 'type here...',
                          hintStyle: TextStyle(color:Colors.grey,fontSize:15,),

                        ),
                      ),
                    ),
                    Row(
                      children: [

                      ],
                    ),

                  ],
                ),
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Later",style: TextStyle(color: Color.fromRGBO(245, 80, 76, 1.0),),),
                    color: Color(0xFFF2F5F7),

                  ),
                  DialogButton(

                    onPressed: () => Navigator.pop(context),
                    child: Text("Save",style: TextStyle(color: Colors.white),),
                    color: Color.fromRGBO(245, 80, 76, 1.0),
                  ),
                ]).show();*/
                                      showDialog(context: context, builder: (BuildContext context)
                                      {
                                        return Center(
                                          child: AlertDialog(
                                            content: Container(
                                              height: 290,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset("assets/images/Driver.png"),
                                                  Text("Choose Driver",
                                                      style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
                                                  Text("Select which driver you want to",
                                                      style:TextStyle(color: Colors.black87,fontSize: 16,)),
                                                  Text("assign to this order",
                                                      style:TextStyle(color: Colors.black87,fontSize: 16,)),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8.0),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton2(
                                                        isExpanded: true,
                                                        hint: Row(
                                                          children:  [
                                                            Image.asset("assets/images/motorbike 2.png",
                                                            height: 24,
                                                            width: 24,),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'Driver name',
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black,
                                                                ),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        items: items
                                                            .map((item) => DropdownMenuItem<String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.start,
                                                          ),
                                                        ))
                                                            .toList(),
                                                        value: selectedValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedValue = value as String;
                                                          });
                                                        },
                                                        buttonStyleData: ButtonStyleData(
                                                          height: 48,
                                                          width: double.infinity,
                                                          padding: const EdgeInsets.only(left: 16, right: 16),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            border: Border.all(
                                                              color: Color(0xFFF2F5F7),
                                                            ),
                                                            color: Color(0xFFF2F5F7),
                                                          ),
                                                          elevation: 1,
                                                        ),
                                                        iconStyleData: const IconStyleData(
                                                          icon: Icon(
                                                            Icons.arrow_drop_down_outlined,
                                                          ),
                                                          iconSize: 14,
                                                          iconEnabledColor: Colors.black,
                                                          iconDisabledColor: Colors.black,
                                                        ),
                                                        dropdownStyleData: DropdownStyleData(
                                                            maxHeight: 200,
                                                            width: 250,
                                                            padding:EdgeInsets.only(left:0),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Color(0xFFF2F5F7),
                                                            ),
                                                            elevation: 8,
                                                            offset: const Offset(-20, 0),
                                                            scrollbarTheme: ScrollbarThemeData(
                                                              radius: const Radius.circular(40),
                                                              thickness: MaterialStateProperty.all(6),
                                                              thumbVisibility: MaterialStateProperty.all(true),
                                                            )),
                                                        menuItemStyleData: const MenuItemStyleData(
                                                          height: 40,
                                                          padding: EdgeInsets.only(left: 14, right: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      canceledButton("Later", 48, 90),
                                                      Container(
                                                        height:48,
                                                        width: 135,
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Color(0xFFF5504C),

                                                        ),
                                                        child: Text("save",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                                      ),

                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    child: Text("Save",style: TextStyle(color: Colors.white),),
                                    color: Color.fromRGBO(245, 80, 76, 1.0),
                                  ),
                                ]).show();
                          },
                          child: acceptButton("Accept", 48, MediaQuery.of(context).size.width/1.8)),
                      InkWell(
                        onTap: (){
                          Alert (
                              context: context,
                              image: Image.asset("assets/images/cancel.png",
                                width: 48,
                                height: 48,),
                              content: Column(
                                children: <Widget>[
                                  Text("Cancel order :(",
                                      style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
                                  Text("Type reason for cancelation",
                                      style:TextStyle(color: Colors.black87,fontSize: 16,)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: TextFormField(
                                      minLines: 4,
                                      maxLines: 4,
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
                                        hintText: 'type here...',
                                        hintStyle: TextStyle(color:Colors.grey,fontSize:15,),

                                      ),
                                    ),
                                  ),
                                  StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                    return Row(
                                      children: [
                                        Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            activeColor: Color.fromRGBO(
                                                245, 80, 76, 1.0),
                                            value: check1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                check1 = value;
                                              });
                                            }
                                        ),
                                        Text("Request for refund",
                                          style:TextStyle(color: Colors.black87,fontSize: 14,),)
                                      ],
                                    );

                                  }
                                  )
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Save",style: TextStyle(color: Colors.white),),
                                  color: Color.fromRGBO(245, 80, 76, 1.0),
                                ),
                              ]).show();
                        },
                          child: canceledButton("Decline", 48, MediaQuery.of(context).size.width/3))
                    ],
                  )
                ],
              ),
            ),

          )
        ],
      )
      /*ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
          data[index],
        ),
      ),*/
    );

  }

}
