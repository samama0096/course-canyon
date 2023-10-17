import 'dart:ui';

import 'package:elearn/interface/views/auth/otp_view.dart';
import 'package:elearn/utils/custom_widgets/backdrop_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/data_constants/image_paths.dart';
import 'package:elearn/utils/custom_widgets/paddings.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/custom_widgets/text_fields.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:elearn/interface/controllers/auth/signup_controller.dart';
import 'package:lottie/lottie.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Back',
            style: TextStyle(fontSize: 15),
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: s.height,
              child: Stack(children: [
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'lib/assets/images/bg-art-2.png',
                    height: s.height,
                  ),
                ),
                SingleChildScrollView(
                    child: Center(
                  child: Column(
                    children: [
                      Hero(
                          tag: 'icon',
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(medBorderRadius),
                            child: Lottie.asset(
                                'lib/assets/lotties/signup.json',
                                height: 150,
                                width: 200,
                                fit: BoxFit.contain,
                                repeat: false),
                          )),
                      SizedBox(
                        height: 100,
                        width: s.width,
                        child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            fixedHorzSpace(20),
                            CustomText.boldText('Getting started to join'),
                            CustomText.boldText('Course Canyon!',
                                fontSize: 20, color: purplePrimary)
                          ],
                        ),
                      ),
                      fixedVerticalSpace(4),
                      SizedBox(
                        width: s.width * 0.9,
                        child: TextFormField(
                            controller: signupController.nameController,
                            cursorColor: cursorColor,
                            decoration: kTxtFielldDecoration(
                                hint: 'Full name', prefixicon: Icons.abc)),
                      ),

                      fixedVerticalSpace(10),
                      SizedBox(
                        width: s.width * 0.9,
                        child: TextFormField(
                            controller: signupController.emailController,
                            cursorColor: cursorColor,
                            decoration: kTxtFielldDecoration(
                                hint: 'abc@gmail.com',
                                prefixicon: Icons.email_rounded)),
                      ),
                      fixedVerticalSpace(10),

                      SizedBox(
                        width: s.width * 0.9,
                        child: TextFormField(
                            controller: signupController.passwordController,
                            cursorColor: cursorColor,
                            decoration:
                                kPasswordFielldDecoration(hint: 'Password')),
                      ),
                      fixedVerticalSpace(10),
                      Padding(
                        padding: AppPaddings.bottomPadding,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () async {
                              signupController.createuser();
                            },
                            child: Container(
                              color: Colors.white,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          smallBorderRadius),
                                      gradient: LinearGradient(colors: [
                                        Theme.of(context).primaryColor,
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.9),
                                        Theme.of(context).primaryColor
                                      ])),
                                  height: 50,
                                  width: s.width * 0.9,
                                  child: Center(
                                      child: CustomText.boldText('Sign up',
                                          color: Colors.white))),
                            ),
                          ),
                        ),
                      ),
                      //  fixedVerticalSpace(30),
                    ],
                  ),
                )),
              ]),
            ),
            Obx(
              () => Visibility(
                  visible: signupController.isLoading.value,
                  child: Positioned.fill(
                      child: getBackDrop('Loading', s.width * 0.7))),
            )
          ],
        ));
  }
}
