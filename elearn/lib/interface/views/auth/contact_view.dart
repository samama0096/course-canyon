import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_widgets/fixed_constants.dart';
import '../../../utils/custom_widgets/paddings.dart';
import '../../../utils/custom_widgets/text_cosntants.dart';
import '../../../utils/data_constants/image_paths.dart';
import '../../../utils/themes/app_theme.dart';
import 'otp_view.dart';
import 'signup_view.dart';

class ContactInputView extends StatelessWidget {
  const ContactInputView({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Information'),
        elevation: 2,
        actions: [
          const SizedBox(
            height: 30,
            width: 30,
            child: Icon(Icons.perm_contact_calendar_rounded),
          ),
          fixedHorzSpace(10),
        ],
      ),
      body: SizedBox(
        height: s.height,
        child: Stack(children: [
          SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: AppPaddings.largePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText.smallText(
                      'Please enter your contact number below and wait for an OTP to get yourself verified.'),
                  fixedVerticalSpace(s.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText.smallText('Enter contact number: *')),
                  ),
                  fixedVerticalSpace(4),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(smallBorderRadius),
                        border: Border.all(
                          color: Colors.blueGrey,
                        )),
                    width: s.width * 0.9,
                    child: Row(
                      children: [
                        fixedHorzSpace(10),
                        Image.asset(
                          AppIcons.pakIconPath,
                          width: 50,
                          height: 50,
                        ),
                        fixedHorzSpace(10),
                        Expanded(
                          child: TextFormField(
                            cursorColor: cursorColor,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '03*********',
                                enabledBorder: InputBorder.none),
                            // decoration: kcontactTxtFielldDecoration(
                            //     hint: '03*********')
                          ),
                        ),
                      ],
                    ),
                  ),
                  //   const Spacer(),
                ],
              ),
            ),
          )),
          Padding(
            padding: AppPaddings.smallPadding,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpView()),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(smallBorderRadius),
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.7)),
                        height: 50,
                        width: s.width * 0.5,
                        child: Center(
                            child: CustomText.boldText('Verify',
                                color: Colors.white))),
                  ),
                  fixedVerticalSpace(10),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignupView()));
                        },
                        child: CustomText.boldUnderlinedText(
                            'Cancel registration.',
                            color: Colors.blue,
                            fontSize: 12)),
                  ),
                  fixedVerticalSpace(20)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
