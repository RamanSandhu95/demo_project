

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/controller/auth_controller.dart';
import 'package:newproject/widgets/common_text_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../utils/app_common_strings.dart';
import '../../utils/common_colors.dart';
import '../../utils/common_font_family.dart';
import '../../widgets/common_button_widget.dart';
import '../../widgets/common_toolbar.dart';
import '../orders/delivering_to_view.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<AuthController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CommonToolbar(toolText: 'Otp Verification',color: Colors.transparent,),
                  Spacer(),
                  CommonTextWidget(msg:AppConstants.wehavesentOtp,textSize: 16.0,font: dSansRegular,color: black525252,),
                  const SizedBox(
                    height: 10,
                  ),

                  CommonTextWidget(msg:controller.phoneNum.value.text,textSize: 16.0,font: dSansBold,color: black000000,),

                  const SizedBox(
                    height: 30,
                  ),
                  OTPTextField(
                      length: 4,
                      contentPadding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width,
                      style: const TextStyle(
                          fontSize: 17
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(focusBorderColor: orangeDC571F,),
                      fieldWidth: 50,
                      onCompleted: (pin) {
                        controller.getOtp(pin);
                      }
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CommonButton(msg: AppConstants.verifyOtp,callback: (){
                    controller.verifyOtp(context);
                    //Get.to(()=> DeliveringToView());
                  },),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      controller.resendOtp(context);
                    },
                      child: CommonTextWidget(msg:AppConstants.resendOtp,textSize: 16.0,font: dSansRegular,color: Colors.green,)),
                  Spacer(),

                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CommonTextWidget(msg:AppConstants.proudlymaeindia.toUpperCase(),textSize: 14.0,font: dSansRegular,color: black525252,)),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
