import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearn/data/services/auth/signup_service.dart';

import '../../../utils/custom_widgets/getx_custom_widgets.dart';

class SignupController extends GetxController {
  //adding .obs() makes the variable observable(to listen for updates, isLoading maybe true in future)
  Rx<bool> isLoading = Rx(false);
  String errormsg = ''.obs();
  int statuscode = 200.obs();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupService signupService = SignupService();

//this function (if fields are valid) will call the signup service and gets new user registered.
  Future createuser() async {
    //check if fields are valid so we can register new user.
    if (areFeildsValid() == true) {
      isLoading.value = true;
      //binding text data to user model variable

      String? response = await signupService.signUpWithEmail(
          name: nameController.text,
          password: passwordController.text.trim(),
          email: emailController.text.trim());

      if (response == 'registered') {
        showSuccess('Account created successfully.');
        isLoading.value = false;
        Get.offAllNamed('/loginView');
      } else if (response == null) {
        showError('server time out');
      } else {
        showError(response);
        isLoading.value = false;
      }
    } else {
      showError(errormsg);
    }
  }

  @override
  void dispose() {
    super.dispose();
    clearFeilds();
    disposeFeilds();
  }

//check feilds validation (checks every validation, can customize it)

  areFeildsValid() {
    if (nameController.text.isEmpty) {
      errormsg = 'Enter valid name';
      return;
    }
    if (!EmailValidator.validate(emailController.text)) {
      errormsg = 'Enter valid email';
      return;
    }
    if (passwordController.text.isEmpty) {
      errormsg = 'Enter valid password';
      return;
    }
    if (passwordController.text.length < 8) {
      errormsg = 'Password is too short';
      return;
    }
    return true;
  }

  //clear all signup feilds
  clearFeilds() {
    nameController.clear();

    emailController.clear();
    passwordController.clear();
  }

  disposeFeilds() {
    nameController.dispose();

    emailController.dispose();
    passwordController.dispose();
  }
}
