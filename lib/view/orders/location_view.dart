

import 'package:flutter/material.dart';
import 'package:newproject/view/orders/location_helper.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [

            
            MapView(),

            MyLocationView()

          ],
        ),
      ),
    );
  }
}


