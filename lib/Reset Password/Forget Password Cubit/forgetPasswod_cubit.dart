import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_admin/shared/network/end_points.dart';
import 'package:market_admin/shared/network/remote/dio_helper.dart';
import '../resetPassword_Model/forgetPassword_model.dart';
import 'forgetPassword_states.dart';

class forgetPasswordCubit extends Cubit<forgetPasswordState>{
  forgetPasswordCubit():super(forgetPasswordInitialState());
  static forgetPasswordCubit get (context)=>BlocProvider.of(context);

  ForgetPasswordModel ? forgetPasswordModel;
  void forget_Password(
      {
        required String email,

      }
      ){
    emit(forgetPasswordLoadingState());
    DioHelper.postData(url: forgetPassword,
        data: {
          'email':email,
        }
    ).then((value){
     forgetPasswordModel=ForgetPasswordModel.fromJson(value.data);
      print(value.data.toString());
      emit(forgetPasswordSuccessState( forgetPasswordModel!));})
    .catchError((error){
  print(error.toString());
  emit(forgetPasswordErrorState(error.toString()));
});
  }

}
