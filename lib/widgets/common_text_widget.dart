


import 'package:flutter/material.dart';
import '../utils/common_colors.dart';
import '../utils/common_font_family.dart';



class CommonTextWidget extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  Color? color;
  TextAlign? textAlign;
  CommonTextWidget({Key? key,this.msg,this.font,this.textSize,this.color,this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(msg!,textAlign:textAlign==null ? TextAlign.start: TextAlign.center,style: TextStyle(fontFamily:font,fontSize:textSize,color: color ),);
  }
}

class CommonRichTextWidget extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  Color? color;
  List<TextSpan>? textSpanList;
  CommonRichTextWidget({Key? key,this.msg,this.textSpanList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            children: textSpanList!
                .map(
                  (data) => data,
            )
                .toList(),
          ),
        )
    );
  }
}


class CommonTextFieldWidget extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  String? title;
  TextEditingController? editController;

  CommonTextFieldWidget({Key? key,this.title,this.msg,this.font,this.textSize,this.editController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(msg:title,textSize: 12,font: dSansRegular,color: black525252,),
        TextField(
          controller: editController,
          style: TextStyle(fontFamily:font,fontSize:textSize,color: orange432821,fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: msg!,

            hintStyle: TextStyle(fontFamily:font,fontSize:textSize,fontWeight: FontWeight.w500 ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: black525252),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: orangeDC571F),
            ),
          ),
        )
      ],
    );
  }
}



class CommonTextFieldPass extends StatelessWidget {
  String? msg;
  String? font;
  double? textSize;
  String? title;
  bool isPassVisible=false;
  VoidCallback callback;
  CommonTextFieldPass({Key? key,this.title,this.msg,this.font,this.textSize,required this.isPassVisible,required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(msg:title,textSize: 14,font: dSansRegular,color: black525252,),
        TextField(
          obscureText: isPassVisible,
          style: TextStyle(fontFamily:font,fontSize:textSize,color: orange432821,fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              hintText: msg!,
              hintStyle: TextStyle(fontFamily:font,fontSize:textSize,fontWeight: FontWeight.w500 ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyD8D8D8),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: orangeDC571F),
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  callback();
                },
                icon: Icon(isPassVisible ?  Icons.visibility_off_outlined:Icons.visibility,color:black525252),
              )
          ),
        )
      ],
    );
  }
}



