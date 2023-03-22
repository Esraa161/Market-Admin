import '../resetPassword_Model/forgetPassword_model.dart';

abstract class forgetPasswordState{}

class forgetPasswordInitialState extends forgetPasswordState{}

class forgetPasswordLoadingState extends forgetPasswordState{}

class forgetPasswordSuccessState extends forgetPasswordState{
  ForgetPasswordModel forgetPasswordModel;
  forgetPasswordSuccessState(this.forgetPasswordModel);

}

class forgetPasswordErrorState extends forgetPasswordState{
  final String error;
  forgetPasswordErrorState(this.error);
}
