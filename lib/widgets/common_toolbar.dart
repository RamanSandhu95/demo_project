


import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


import '../utils/common_colors.dart';
import '../utils/common_font_family.dart';
import 'common_text_widget.dart';

class CommonToolbar extends StatelessWidget {
  final String? toolText;
  final Color? color;
  const CommonToolbar({Key? key,required this.toolText,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color!=null ?color: Colors.white,
      height: kToolbarHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:  InkWell(
              onTap: (){
                //Get.toNamed("/");
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.only(left:10.0),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          Align(alignment: Alignment.center,child: CommonTextWidget(msg:toolText,textSize: 19.0,color: black000000,font: dSansBold,),)

        ],
      ),
    );
  }
}