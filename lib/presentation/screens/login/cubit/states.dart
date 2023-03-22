import 'package:market_admin/presentation/screens/login/Login%20Model/Login_model.dart';

abstract class loginState{}

class loginInitialState extends loginState{}

class loginLoadingState extends loginState{}

class loginSuccessState extends loginState{
  LoginModel loginModel;
  loginSuccessState(this.loginModel);

}

class loginErrorState extends loginState{
  final String error;
  loginErrorState(this.error);
}

