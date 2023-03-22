import 'package:market_admin/Update%20Password/Update%20Password%20Model/updatePassword_model.dart';

abstract class updatePasswordState{}

class updatePasswordInitialState extends updatePasswordState{}

class updatePasswordLoadingState extends updatePasswordState{}

class updatePasswordSuccessState extends updatePasswordState{
  UpdatePasswordModel updatePasswordModel;
  updatePasswordSuccessState(this.updatePasswordModel);

}

class updatePasswordErrorState extends updatePasswordState{
  final String error;
  updatePasswordErrorState(this.error);
}
