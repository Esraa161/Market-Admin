import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/botton_widget.dart';
import '../widgets/components.dart';
import 'Language Cubit/language_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class setting_screen extends StatefulWidget {
  const setting_screen({Key? key}) : super(key: key);

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  bool? check1 = false;

  bool State= false;
  String ? Order_status;
  String? language_status;
  bool ? recive_stste= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of (context)!.settings,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF363537)),),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:24.0,right: 16,left: 16),
            child: ExpansionTile(
              collapsedIconColor: Colors.black,
              trailing:Icon(Icons.arrow_drop_down_outlined),
              iconColor:Colors.white,
              title: Row(
                children: [
                  Image.asset("assets/images/market.png",
                    width: 21.3,
                    height: 24,),
                  appBaretitle("   ${AppLocalizations.of (context)!.market_status}"),

                ],
              ),
              childrenPadding: EdgeInsets.all(5),
              children: [
                Container(
                  height:MediaQuery.of(context).size.height/4.2,
                  width: 312,
                  padding: EdgeInsets.only(bottom: 5),
                  child:BlocBuilder<RadioListTileCubit, int>(
                     builder: (context, state) {
                       return  Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                           title: cardText(AppLocalizations.of (context)!.available),
                       activeColor: Color(0xFFF5504C),
                        value: 0,
                        groupValue: state,
                        onChanged: (value){
                          context.read<RadioListTileCubit>().selectItem(value!);
                        },
                      ),
                          RadioListTile(
                           controlAffinity: ListTileControlAffinity.trailing,
                           title: cardText(AppLocalizations.of (context)!.busy),
                        value: 1,
                        activeColor: Color(0xFFF5504C),
                        groupValue: state,
                        onChanged: (value){
                          context.read<RadioListTileCubit>().selectItem(value!);
                        },
                      ),
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: cardText(AppLocalizations.of (context)!.closed),
                        value: 2 ,
                        activeColor: Color(0xFFF5504C),
                        groupValue: state,
                        onChanged: (value){
                          context.read<RadioListTileCubit>().selectItem(value!);
                        },
                      ),
                    ],
                  );
                     })


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
                  Image.asset("assets/images/Recive.png",
                    width: 21.3,
                    height: 24,),
                  appBaretitle("   Recive Method"),

                ],
              ),
              childrenPadding: EdgeInsets.all(5),
              children: [
                Container(
                  height:MediaQuery.of(context).size.height/7,
                  width: 312,
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                     Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardText(("Delivery")),
                          StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                            return Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                activeColor: Color.fromRGBO(
                                    245, 80, 76, 1.0),
                                value: check1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    check1 = value;
                                  });
                                }
                            );

                          }
                          ),

                        ],),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardText(("Pickup")),
                          StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                            return Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                activeColor: Color.fromRGBO(
                                    245, 80, 76, 1.0),
                                value: check1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    check1 = value;
                                  });
                                }
                            );

                          }
                          ),
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
                  //Image.asset("assets/images/market.png",
                   // width: 21.3,
                   // height: 24,),
                  Icon(Icons.language,color: Colors.black,),
                  appBaretitle("   Language"),

                ],
              ),
              childrenPadding: EdgeInsets.all(5),
              children: [
                Container(
                  height:MediaQuery.of(context).size.height/7,
                  width: 312,
                  padding: EdgeInsets.only(bottom: 5),
                  child:BlocBuilder<RadioListTileCubit, int>(
                     builder: (context, state) {
                       return Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: cardText("Arabic"),
                        activeColor: Color(0xFFF5504C),
                        value: 0,
                        groupValue: state,
                        onChanged: (value){
                          context.read<RadioListTileCubit>().selectItem(value!);
                          context.read<LanguageCubit>()..changeLanguage('ar');
                        },
                      ),
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: cardText("English"),
                        value:1,
                        activeColor: Color(0xFFF5504C),
                        groupValue: state,
                        onChanged: (value){
                          context.read<RadioListTileCubit>().selectItem(value!);
                          context.read<LanguageCubit>()..changeLanguage('en');
                        },
                      ),
                    ],
                  );
                     })


                ),
              ],


            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 31.0),
            child: botton_widget("Save"),
          ),
        ],
      ),
    );
  }
}
