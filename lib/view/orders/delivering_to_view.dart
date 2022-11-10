

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/view/orders/location_view.dart';
import 'package:newproject/widgets/common_text_widget.dart';
import '../../binding/auth_binding.dart';
import '../../controller/location_controller.dart';
import '../../utils/app_common_strings.dart';
import '../../utils/common_colors.dart';
import '../../utils/common_font_family.dart';

class DeliveringToView extends StatefulWidget {
  const DeliveringToView({Key? key}) : super(key: key);

  @override
  State<DeliveringToView> createState() => _DeliveringToViewState();
}

class _DeliveringToViewState extends State<DeliveringToView> {

  @override
  void initState() {
   navigateToScreen();
    super.initState();
  }

  Timer navigateToScreen(){
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  void route(){
    Get.to(()=>LocationView(),binding: AuthBinding());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:  GetBuilder<LocationController>(
              builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset("assets/images/img_location_pin.png",width: MediaQuery.of(context).size.width/2,),
                  const SizedBox(
                    height: 50,
                  ),

                  CommonTextWidget(msg:AppConstants.deliveringTo.toUpperCase(),textSize: 16.0,font: dSansMedium,color: black525252,),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on,color: Colors.green,),
                      const SizedBox(width: 5,),
                      CommonTextWidget(msg:AppConstants.Blockto.toUpperCase(),textSize: 20.0,font: georgiaBold,color: black000000,),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextWidget(msg:controller.currentAddress.value.toUpperCase()!="" ? controller.currentAddress.value.toUpperCase():AppConstants.Address.toUpperCase() ,textAlign: TextAlign.start,textSize: 16.0,font: dSansRegular,color: black525252,),


                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
