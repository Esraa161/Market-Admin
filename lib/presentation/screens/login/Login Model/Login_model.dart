import 'Data.dart';

class LoginModel {
  LoginModel({
      this.success,
      this.data, 
      this.message,});

  LoginModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool?  success;
  Data ?data;
  String? message;



}