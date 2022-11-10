import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/controller/auth_controller.dart';
import 'package:newproject/widgets/common_text_widget.dart';

import '../../utils/app_common_strings.dart';
import '../../utils/common_colors.dart';
import '../../utils/common_font_family.dart';
import '../../widgets/common_button_widget.dart';
import 'otp_verification.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<AuthController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset("assets/images/img_food_truck.png",width: MediaQuery.of(context).size.width/2.8,),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTextWidget(
                          msg: AppConstants.indiafirst.toUpperCase(),
                          textSize: 25.0,
                          font: georgiaBold,
                          color: black000000,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTextWidget(
                          msg: AppConstants.appforstreet.toUpperCase(),
                          textSize: 18.0,
                          font: dSansRegular,
                          color: black525252,
                        )
                      ],
                    )),


                const SizedBox(
                  height: 40,
                ),
                CommonTextWidget(
                  msg: AppConstants.amlostthere.toUpperCase(),
                  textSize: 16.0,
                  font: dSansBold,
                  color: black000000,
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextWidget(
                  msg: AppConstants.loginorsignupforplaceorder,
                  textSize: 16.0,
                  font: dSansRegular,
                  color: black525252,
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonTextFieldWidget(
                  title: AppConstants.phoneNumber.toUpperCase(),
                  msg: "Enter Phone Number",
                  font: dSansRegular,
                  textSize: 13.0,
                  editController: controller.phoneNum.value,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  msg: AppConstants.continuee,
                  callback: () {
                    controller.apiCall(context);
                  },
                ),
                Spacer(),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: CommonTextWidget(
                      msg: AppConstants.proudlymaeindia.toUpperCase(),
                      textSize: 14.0,
                      font: dSansRegular,
                      color: black525252,
                    )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
