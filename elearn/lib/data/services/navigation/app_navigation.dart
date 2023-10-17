import 'package:flutter/material.dart';
import 'package:get/get.dart';

//a navigation service class for whole app using GetX, we will use it to navigate between pages of going back
//GetX don't require any BuildContext context to navigate
class AppNavigation {
  static void goBack() {
    Get.back();
  }

  // Error Dialog
  static void showErrorDialog({
    String title = 'Error',
    required String message,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      content: Text(message),
      confirm: ElevatedButton(
        onPressed: () {
          onConfirm.call();
          Get.back();
        },
        child: const Text('OK'),
      ),
    );
  }

  // Success Dialog
  static void showSuccessDialog({
    String title = 'Success',
    required String message,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      content: Text(message),
      confirm: ElevatedButton(
        onPressed: () {
          onConfirm.call();
          Get.back();
        },
        child: const Text('OK'),
      ),
    );
  }

  // Loading Dialog
  static void showLoadingDialog() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }

  static void toPage(String route, BuildContext context) {
    Navigator.pushNamed(context, route);
  }

  static void toPageAndRemove(String route, BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
