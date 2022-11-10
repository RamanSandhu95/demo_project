import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/binding/auth_binding.dart';
import 'package:newproject/constant/string_constant.dart';
import 'package:newproject/network/auth_api_call.dart';
import 'package:newproject/utils/constant_validation.dart';
import 'package:newproject/view/auth/otp_verification.dart';
import 'package:newproject/view/orders/delivering_to_view.dart';
import 'package:newproject/widgets/common_snackbar.dart';

class AuthController extends GetxController {
  /*
  * Initializing  text editing controller
   */
  var phoneNum = TextEditingController().obs;
  RxString otpData = "".obs;
  RxBool isLoading=false.obs;

  void getOtp(otp) {
    otpData.value = otp;
    update();
  }

  //Todo: validating feilds
  validateController() {
    if (validateEmptyValue(phoneNum.value.text.trim())) {
      return "Please Enter Phone Number";
    } else if (phoneNum.value.text.length != 10) {
      return "Phone Number Should be 10 character ";
    } else {
      return "";
    }
  }

  ///Todo: api call
  apiCall(context) {
    if (validateController() == "") {
      CircularProgressIndicator();
      AuthenticationApi.sendOtp(context, sendOtpEndpoint, {
        "request_with": "send-otp",
        "phone": phoneNum.value.text
      }).then((value) {
        if (value["success"] == true) {
          Get.back();
          snackBarCommon(" Server error", value["message"]);
          Get.off(() => OtpVerificationView());
        } else {
          Get.back();
          snackBarCommon(" Server error", value["message"]);
        }
      });
    } else {
      snackBarCommon("Validation error", validateController().toString());
    }
  }

  //Todo: validating otp
  validateOtp() {
    if (validateEmptyValue(otpData.value)) {
      return "Please Enter OTP ";
    } else {
      return "";
    }
  }

  //Todo: this method  is used to verify otp
  verifyOtp(context) {
    if (validateOtp() == "") {

      AuthenticationApi.verifyOtp(context, verifyOtpEndpoint, {
        "request_with": "verify-otp",
        "phone": phoneNum.value.text,
        "otp": otpData.value
      }).then((value) {
        if (value["success"] == true) {
          Get.back();
          snackBarCommon(" Server error", value["message"]);
          Get.off(() => DeliveringToView(),binding: AuthBinding());
        } else {
          Get.back();
          Get.off(() => DeliveringToView(),binding: AuthBinding());
          snackBarCommon(" Server error", value["errors"]["message"]);
        }
      });
    } else {
      snackBarCommon("Validation error", validateOtp().toString());
      Get.off(() => DeliveringToView(),binding: AuthBinding());
    }
  }

  resendOtp(context) {

    AuthenticationApi.reSendOtp(context, resendOtpEndpoint, {
      "request_with": "resend-otp",
      "phone": phoneNum.value.text
    }).then((value) {
      if (value["success"] == true) {
        Get.back();
        snackBarCommon(" Server error", value["message"]);
      } else {
        Get.back();
        snackBarCommon(" Server error", value["message"]);
      }
    });
  }
}
