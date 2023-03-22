/// success : true
/// data : true
/// message : "Reset link was sent successfully"

class ForgetPasswordModel {
  ForgetPasswordModel({
      bool? success, 
      bool? data, 
      String? message,}){
    success = success;
    data = data;
    message = message;
}

  ForgetPasswordModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }
  bool? success;
  bool? data;
  String? message;
ForgetPasswordModel copyWith({  bool? success,
  bool? data,
  String? message,
}) => ForgetPasswordModel(  success: success ?? success,
  data: data ?? data,
  message: message ?? message,
);

}