import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/utils/common_colors.dart';

SnackbarController snackBarCommon(tittle, msg) {
  return Get.snackbar(tittle, msg,
      backgroundColor: brown0432821.withOpacity(0.8),
      colorText: Colors.white,
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: brown0432821,
      isDismissible: true,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      icon: const Icon(Icons.error, color: Colors.white),
      forwardAnimationCurve: Curves.easeOutBack,
      dismissDirection: DismissDirection.endToStart);
}
