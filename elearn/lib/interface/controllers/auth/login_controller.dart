import 'package:elearn/data/localstorage/user_prefs.dart';
import 'package:elearn/data/services/auth/login_service.dart';
import 'package:elearn/interface/controllers/auth/splash_controller.dart';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../utils/custom_widgets/getx_custom_widgets.dart';

class LoginController extends GetxController {
  Rx<bool> isLoading = Rx(false);
  SplashController splashController = Get.find();
  String errormsg = ''.obs();
  final UserPrefs _userPrefs = UserPrefs();
  LoginService loginService = LoginService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<User?> user = Rx(null);

//function to call when user clicks on simple login
  loginWithEmail() async {
    if (areFeildsValid() == true) {
      String? response;

      isLoading.value = true;
      response = await loginService.loginWithEmail(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      if (response == 'logged in') {
        user.value = await loginService.getDataForEmailLogin(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        final bool isDataSaved = await _userPrefs.saveUserData(NewUser(
            fname: user.value?.displayName ?? '',
            email: user.value?.email ?? '',
            type: 0));
        if (isDataSaved) {
          isLoading.value = false;

          showSuccess('${user.value?.displayName}! good to see you back.');
          splashController.getUserDataFromLocal();
          Get.offAllNamed('/stackedhomeview');
        } else {
          showError('Need storage permission to work flawlessly');
        }
      }
      if (response == null) {
        showError('Server time out');
      } else if (response != 'logged in' && response.isNotEmpty) {
        showError(response);
      }
    } else {
      showError(errormsg);
    }
    isLoading.value = false;
  }

//function to call when user clicks on google signin
  getGoogleSignin() async {
    isLoading.value = true;
    user.value = await loginService.loginWithGoogle();
    isLoading.value = false;

    errormsg =
        user.value!.email!.isEmpty ? 'Google sigin failed for the moment.' : '';
    if (user.value != null) {
      final bool isDataSaved = await _userPrefs.saveUserData(NewUser(
          fname: user.value?.displayName ?? '',
          email: user.value?.email ?? '',
          photoUrl: user.value?.photoURL,
          type: 1));
      if (isDataSaved) {
        isLoading.value = false;
        splashController.getUserDataFromLocal();
        showSuccess('${user.value?.displayName}! good to see you back.');
        Get.offAllNamed('/stackedhomeview');
      } else {
        showError('Need storage permission to work flawlessly');
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

  areFeildsValid() {
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

  //clear all login feilds
  clearFeilds() {
    emailController.clear();
    passwordController.clear();
  }

  disposeFeilds() {
    emailController.dispose();
    passwordController.dispose();
  }
}
