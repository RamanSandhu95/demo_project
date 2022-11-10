


import 'package:flutter/material.dart';
import '../utils/common_colors.dart';
import '../utils/common_font_family.dart';
import 'common_text_widget.dart';

class CommonButton extends StatelessWidget {
  String? msg;
  VoidCallback? callback;
  CommonButton({Key? key,this.msg,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: greyD8D8D8,backgroundColor: orangeDC571F),
        onPressed: (){
          callback!();
        },
        child: CommonTextWidget(msg:msg,textSize: 18.0,font: dSansBold,color: whiteffffff,),
      ),
    );
  }
}