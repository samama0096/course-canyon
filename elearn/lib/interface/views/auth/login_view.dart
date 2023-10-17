import 'package:elearn/interface/controllers/auth/login_controller.dart';
import 'package:elearn/interface/views/stacked_layout/stacked_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/data_constants/image_paths.dart';
import 'package:elearn/utils/custom_widgets/paddings.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/custom_widgets/text_fields.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:elearn/interface/views/auth/contact_view.dart';
import 'package:elearn/interface/views/auth/signup_view.dart';

import '../../../utils/custom_widgets/backdrop_loading.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'lib/assets/images/bg-art-3.png',
                height: s.height * 0.5,
                width: s.width,
              ),
            ),
          ),
          SizedBox(
            height: s.height,
            width: s.width * 0.9,
            child: ListView(shrinkWrap: true, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  fixedVerticalSpace(30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText.boldText(
                      'Welcome to',
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText.boldText('Course Canyon.',
                        fontSize: 26, color: purplePrimary),
                  ),
                  fixedVerticalSpace(s.height * 0.1),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText.boldText('Login.',
                        fontSize: 26, color: purplePrimary),
                  ),
                  fixedVerticalSpace(s.height * 0.05),
                  SizedBox(
                    width: s.width * 0.9,
                    child: TextFormField(
                        controller: loginController.emailController,
                        cursorColor: cursorColor,
                        decoration: kTxtFielldDecoration(
                            hint: 'Your email',
                            prefixicon: Icons.email_rounded)),
                  ),
                  fixedVerticalSpace(10),
                  fixedVerticalSpace(4),
                  SizedBox(
                    width: s.width * 0.9,
                    child: TextFormField(
                        controller: loginController.passwordController,
                        cursorColor: cursorColor,
                        decoration: kPasswordFielldDecoration(
                          hint: 'Password',
                        )),
                  ),
                  Padding(
                    padding: AppPaddings.rightPadding,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 30,
                        child: TextButton(
                          child: CustomText.normalText('Forgot password?',
                              color: purplePrimary, fontSize: 10),
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: true,
                                showDragHandle: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: s.height * 0.7,
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomText.boldText(
                                                'Forgot password'),
                                            fixedVerticalSpace(10),
                                            Padding(
                                              padding: AppPaddings
                                                  .customSymmetricPadding(
                                                      h: 20, v: 0),
                                              child: CustomText.smallText(
                                                  'A password-reset link will be sent to your email, you can reset password from there.'),
                                            ),
                                            fixedVerticalSpace(20),
                                            SizedBox(
                                              width: s.width * 0.9,
                                              child: TextFormField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  cursorColor: cursorColor,
                                                  decoration:
                                                      kTxtFielldDecoration(
                                                          hint:
                                                              'Enter your email',
                                                          prefixicon: Icons
                                                              .email_rounded)),
                                            ),
                                            fixedVerticalSpace(10),
                                            InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           const StackedHomePage()),
                                                // );
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              smallBorderRadius),
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .secondary,
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .secondary
                                                                .withOpacity(
                                                                    0.7),
                                                            lightOrangesecondary
                                                          ])),
                                                  height: 50,
                                                  width: s.width * 0.9,
                                                  child: Center(
                                                      child:
                                                          CustomText.boldText(
                                                              'Continue',
                                                              color: Colors
                                                                  .white))),
                                            ),
                                          ]),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                  fixedVerticalSpace(30),
                  InkWell(
                    onTap: () async {
                      await loginController.loginWithEmail();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(smallBorderRadius),
                            gradient: LinearGradient(colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.9),
                              Theme.of(context).primaryColor
                            ])),
                        height: 50,
                        width: s.width * 0.9,
                        child: Center(
                            child: CustomText.boldText('LOGIN',
                                color: Colors.white))),
                  ),
                  fixedVerticalSpace(10),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                        onPressed: () {},
                        child: CustomText.smallText('or continue using',
                            fontSize: 12)),
                  ),
                  InkWell(
                    onTap: () {
                      loginController.getGoogleSignin();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(smallBorderRadius),
                            border: Border.all(color: Colors.blue)),
                        width: 60,
                        height: 60,
                        child: Center(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(medBorderRadius),
                            child: Image.asset(
                              AppIcons.googleIconPath,
                              height: 60,
                              width: 60,
                            ),
                          ),
                        )),
                  ),
                  Divider(
                    color: surfacePurpleColor,
                    indent: s.width * 0.1,
                    endIndent: s.width * 0.1,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 30,
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed('/signupview');
                      },
                      child: CustomText.boldUnderlinedText(
                          'Don\'t have an account? Create.',
                          color: purplePrimary,
                          fontSize: 12)),
                ),
              ),
            ]),
          ),
          Obx(
            () => Visibility(
                visible: loginController.isLoading.value,
                child: Positioned.fill(
                    child: getBackDrop('Loading', s.width * 0.7))),
          )
        ],
      ),
    ));
  }
}
