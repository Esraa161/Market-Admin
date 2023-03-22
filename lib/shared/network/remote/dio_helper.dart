import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DioHelper{
  static Dio ? dio;
  static init(){
    dio= Dio(
      BaseOptions(
        baseUrl:'https://dev.talabatcom.sa/Admin',
        receiveDataWhenStatusError: true,
        headers: {
        }
      )
    );
  }
  static Future<Response> getData(
      {required String url,
        required Map<String, dynamic>? query,}) async {
    return await dio!.get(url, queryParameters: query);
  }
  static Future<Response> postData(
      {required String url,
  required Map<String, dynamic>? data
      }) async {
    return await dio!.post(url,data: data);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    return token;
  }


}