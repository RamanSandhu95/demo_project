import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/utils/common_colors.dart';
import 'package:newproject/widgets/common_text_widget.dart';

import '../../controller/location_controller.dart';
import '../../utils/app_common_strings.dart';
import '../../utils/common_font_family.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.only(left:20,right: 20,bottom: 10),
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: grey99F2F2F2
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white
                    ),
                    child: Icon(Icons.shopping_cart,color: orangeDC571F,),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      CommonTextWidget(msg:"MOMO HUB",textSize: 16.0,font: dSansBold,color: black000000,),

                      Row(children: [
                        const Icon(Icons.star,size: 10,),
                        CommonTextWidget(msg:" 4.1",textSize: 12.0,font: dSansRegular,color: black000000,),
                        const SizedBox(width: 10,),
                        const Icon(Icons.circle,size: 6,),
                        CommonTextWidget(msg:" 34 mins",textSize: 12.0,font: dSansRegular,color: black000000,),
                        const SizedBox(width: 10,),
                        const Icon(Icons.circle,size: 6,),
                        CommonTextWidget(msg:" 1 km",textSize: 12.0,font: dSansRegular,color: black000000,),


                      ],),
                      CommonTextWidget(msg:"Chinese,Momos,Noodeles,....",textSize: 14.0,font: dSansMedium,color: black000000,),

                      CommonTextWidget(msg:"Sector 4 gurugram",textSize: 12.0,font: dSansRegular,color: greyD9D9D9,),

                    ],
                  ))
                ],
              ),
            ),
          ),
        );
      },itemCount: 4,);
  }
}



class BestSellers extends StatelessWidget {
  const BestSellers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(left:10,bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return  Container(
            width: 150,
            margin: EdgeInsets.all(10.0),
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: orangeDC571F
            ),
            child: const Icon(Icons.shopping_cart,color: orangeDC571F,),
          );
        },itemCount: 4,),
    );
  }
}



class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 20.0),
      child: Row(
        children: [
          Expanded(
              child: commonCat("Food","assets/images/img_food.png")),
          Expanded(
              child: commonCat("Fresh","assets/images/img_fresh.png")),
          Expanded(
              child: commonCat("Mart","assets/images/img_mart.png")),
        ],
      ),
    );
  }

  Widget commonCat(title,image){
    return  Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(height: 10,),
        CommonTextWidget(msg:title,textSize: 12.0,font: dSansRegular,color: black525252,),

      ],
    );
  }
}


class CoursoulView extends StatelessWidget {
  const CoursoulView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 20.0),
      child:  Container(
        width: double.infinity,
        height: 150,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.black
        ),
        child: Icon(Icons.shopping_cart,color: orangeDC571F,),
      ),
    );
  }

  Widget commonCat(title){
    return  Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
          ),
          child: Icon(Icons.shopping_cart,color: orangeDC571F,),
        ),
        SizedBox(height: 10,),
        CommonTextWidget(msg:title,textSize: 12.0,font: dSansRegular,color: black525252,),

      ],
    );
  }
}



class TopView extends StatelessWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 20.0),
      child: Row(
        children: [
          Expanded(
              child: GetBuilder<LocationController>(
                  builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.navigation_sharp,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CommonTextWidget(
                            msg: controller.currentLocality.value.toUpperCase()!="" ? controller.currentLocality.value.toUpperCase():AppConstants.Blockto.toUpperCase(),
                            textSize: 20.0,
                            font: georgiaBold,
                            color: black000000,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextWidget(msg:controller.currentAddress.value.toUpperCase()!="" ? controller.currentAddress.value.toUpperCase():AppConstants.Address.toUpperCase() ,textAlign: TextAlign.start,textSize: 16.0,font: dSansRegular,color: black525252,),

                    ],
                  );
                }
              )),
          SizedBox(width: 20,),
          const Icon(
            Icons.fastfood,
            color: orangeDC571F,
          ),
        ],
      ),
    );
  }
}





class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 10),
      padding: EdgeInsets.only(left:10.0,right: 10.0),
      decoration: BoxDecoration(
          color: greybgD7D7D7,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        children: [
          Expanded(
              child:  TextField(
                style: TextStyle(fontFamily:dSansMedium,fontSize:14.0,fontWeight: FontWeight.w500 ),
                decoration: InputDecoration(
                    hintText: "Search for the kast items",
                    hintStyle: TextStyle(fontFamily:dSansMedium,fontSize:14.0,fontWeight: FontWeight.w500 ),
                    border: InputBorder.none
                ),
              )
          ),
          SizedBox(width: 20,),
          const Icon(
            Icons.search,
            color: black525252,
          ),
        ],
      ),
    );
  }
}