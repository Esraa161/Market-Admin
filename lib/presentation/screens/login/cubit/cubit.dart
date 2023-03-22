import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:market_admin/presentation/screens/login/Login%20Model/Login_model.dart';
import 'package:market_admin/presentation/screens/login/cubit/states.dart';
import 'package:market_admin/shared/network/end_points.dart';
import 'package:market_admin/shared/network/remote/dio_helper.dart';

class loginCubit extends Cubit<loginState>{
loginCubit():super(loginInitialState());
static loginCubit get (context)=>BlocProvider.of(context);

LoginModel ? loginModel;
void userLogin(
{
  required String email,
  required String password,
}
    ){
  emit(loginLoadingState());
DioHelper.postData(url: login,
    data: {
  'email':email,
  'password':password,
}
).then((value){
   loginModel=LoginModel.fromJson(value.data);
  print(value.data);
  emit(loginSuccessState( loginModel!));});
/*..catchError((error){
  print(error.toString());
  emit(loginErrorState(error.toString()));
});*/
}

}

enum ConnectivityStatus { connected, disconnected, unknown }

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  ConnectivityCubit() : super(ConnectivityStatus.unknown);

  Future<void> checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      emit(ConnectivityStatus.connected);
    } else {
      emit(ConnectivityStatus.disconnected);
    }
  }
}

