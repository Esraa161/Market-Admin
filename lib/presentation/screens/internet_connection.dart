import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_admin/presentation/screens/login/login_screen.dart';
class internet_connection extends StatelessWidget {
  const internet_connection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity=Connectivity();
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
        stream:connectivity.onConnectivityChanged,
         builder: (_,snapshot){
          return InternetConnectionWidget(snapshot: snapshot,widget:login_screen());
        },
      ),
    );
  }
}

class InternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult>snapshot;
  final Widget widget;
  const InternetConnectionWidget({Key? key,
  required this.widget,
  required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(snapshot.connectionState){
      case ConnectionState.active:
        final state = snapshot.data!;
        switch(state){
          case ConnectivityResult.none:
            return Column(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Icon(Icons.wifi_off,size: 50,),
                Center(
                  child:Text("No Internet"),),
              ],
            );
          default:
            return widget;
        }
      default:
        return Text("");
    }
  }
}
