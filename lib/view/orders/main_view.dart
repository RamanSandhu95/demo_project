import 'package:flutter/material.dart';

import 'dashboard_helper.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
                TopView(),
                SearchView(),
                CategoryView(),
                CoursoulView(),
                BestSellers(),
                Wrap(
                  children: [
                    FoodListView()
                  ],
                )

              ]
          ),
        ),
      ),
    );
  }
}