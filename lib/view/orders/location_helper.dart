import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newproject/binding/auth_binding.dart';
import 'package:newproject/controller/location_controller.dart';
import 'package:newproject/widgets/common_button_widget.dart';

import '../../utils/app_common_strings.dart';
import '../../utils/common_colors.dart';
import '../../utils/common_font_family.dart';
import '../../widgets/common_text_widget.dart';
import '../../widgets/common_toolbar.dart';
import 'main_view.dart';

class MyLocationView extends StatelessWidget {
  const MyLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: GetBuilder<LocationController>(
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonTextWidget(msg:AppConstants.selectdeliveryLocation.toUpperCase(),textSize: 14.0,font: dSansRegular,color: black525252,),
                        const SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on,color: Colors.green,),
                            const SizedBox(width: 5,),
                            CommonTextWidget(msg:controller.currentLocality.value.toUpperCase()!="" ? controller.currentLocality.value.toUpperCase():AppConstants.Blockto.toUpperCase(),textSize: 20.0,font: georgiaBold,color: black000000,),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        CommonTextWidget(msg:controller.currentAddress.value.toUpperCase()!="" ? controller.currentAddress.value.toUpperCase():AppConstants.Address.toUpperCase() ,textAlign: TextAlign.start,textSize: 16.0,font: dSansRegular,color: black525252,),

                      ],
                    );
                  }
                )),
                Container(
                  decoration: BoxDecoration(
                    color: grey99F2F2F2,
                   border: Border.all(color: black000045,width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
                    child: CommonTextWidget(msg:AppConstants.Change.toUpperCase(),textSize: 14.0,font: dSansMedium,color: orangeDC571F,),
                  ),
                ),


              ],
            ),
            const SizedBox(height: 10,),
            CommonButton(msg: "Confirm Location".toUpperCase(),callback: (){
              Get.offAll(()=> const DashBoardView(),binding: AuthBinding());
            },)
          ],
        ),
      ),
    );
  }
}



class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
          children: [
            SizedBox(
              child: GetBuilder<LocationController>(
                builder: (controller)  {

                  return GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLatLng.value,
                      zoom: 14.433
                    ),
                    onMapCreated: (GoogleMapController controllerGoogleMap) {
                       controller.controllerGoogleMap.complete(controllerGoogleMap);
                    },
                  );
                }
              ),
            ),
            const CommonToolbar(
              toolText: '',
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  Get.find<LocationController>().updateMap();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_searching_rounded,
                          color: orangeDC571F,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CommonTextWidget(
                          msg: AppConstants.locateme.toUpperCase(),
                          textSize: 16.0,
                          font: dSansBold,
                          color: orangeDC571F,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}