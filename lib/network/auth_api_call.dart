

  import 'package:flutter/material.dart';
import 'package:newproject/network/api_call_network.dart';

class AuthenticationApi{

    /*
  * Send Otp http call method
   */
    static Future<dynamic> sendOtp(
        BuildContext context, String endPoint, Map<String, dynamic> body) async {
      final response = await callPostApi(body, endPoint, isFormData: false);
      try {
        if (response['success'] == true) {
          return response;
        }
      } catch (e) {
        print(e);
      }
      return response;
    }


    /*
  * verify Otp http call method
   */
    static Future<dynamic> verifyOtp(
        BuildContext context, String endPoint, Map<String, dynamic> body) async {
      final response = await callPostApi(body, endPoint, isFormData: false);
      try {
        if (response['success'] == true) {
          return response;
        }
      } catch (e) {
        print(e);
      }
      return response;
    }
    /*
  *  ReSend Otp http call method
   */
    static Future<dynamic> reSendOtp(
        BuildContext context, String endPoint, Map<String, dynamic> body) async {
      final response = await callPostApi(body, endPoint, isFormData: false);
      try {
        if (response['success'] == true) {
          return response;
        }
      } catch (e) {
        print(e);
      }
      return response;
    }

    /*
  *  ReSend Otp http call method
   */
    static Future<dynamic> logoutUser(
        BuildContext context, String endPoint, Map<String, dynamic> body) async {
      final response = await callPostApi(body, endPoint, isFormData: false);
      try {
        if (response['success'] == true) {
          return response;
        }
      } catch (e) {
        print(e);
      }
      return response;
    }

}