import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/app_theme.dart';

showError(String errormsg) {
  if (errormsg.isNotEmpty) {
    Get.snackbar('Error:', errormsg,
        icon: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
        overlayBlur: 1,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 1),
        backgroundColor: errorOrange,
        colorText: Colors.white);
  }
}

showSuccess(String msg) {
  if (msg.isNotEmpty) {
    Get.snackbar('Success:', msg,
        icon: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
        overlayBlur: 1,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.green.shade300,
        colorText: Colors.white);
  }
}
