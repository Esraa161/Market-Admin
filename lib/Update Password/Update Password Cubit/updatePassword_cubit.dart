import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_admin/Update%20Password/Update%20Password%20Cubit/updatePassword_states.dart';
import 'package:market_admin/shared/network/end_points.dart';
import 'package:market_admin/shared/network/remote/dio_helper.dart';
import '../Update Password Model/updatePassword_model.dart';

class updatePasswordCubit extends Cubit<updatePasswordState>{
  updatePasswordCubit():super(updatePasswordInitialState());
  static updatePasswordCubit get (context)=>BlocProvider.of(context);

  UpdatePasswordModel ? updatePasswordModel;
  void update_Password(
      {
        required String email,
        required String password,
        required String password_confirmation,

      }
      ){
    emit(updatePasswordLoadingState());
    DioHelper.postData(url: updatePassword,
        data: {
          'email':email,
          'password':password,
          'password_confirmation':password_confirmation,

        }
    ).then((value){
      updatePasswordModel=UpdatePasswordModel.fromJson(value.data);
      print(value.data.toString());
      emit(updatePasswordSuccessState( updatePasswordModel!));})
        .catchError((error){
      print(error.toString());
      emit(updatePasswordErrorState(error.toString()));
    });
  }

}