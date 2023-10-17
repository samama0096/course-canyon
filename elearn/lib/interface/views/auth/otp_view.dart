import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/paddings.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  Timer? timer;
  int start = 4;

  FocusNode focusNode = FocusNode();
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your email'),
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
        child: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: AppPaddings.largePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                fixedVerticalSpace(s.height * 0.1),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: CustomText.smallText(
                        'Enter 4-digit pin you recieved: '),
                  ),
                ),
                fixedVerticalSpace(20),
                SizedBox(
                  width: s.width * 0.9,
                  child: buildPinPut(focusNode),
                ),
                fixedVerticalSpace(30),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              style: TextStyle(color: Colors.black),
                              text:
                                  'An otp was sent to your email, fill in to get verified. If you did\'nt recieve an otp, you can resend it after  '),
                          TextSpan(
                            text:
                                ' ${start < 10 ? '00:0$start' : '00:$start'} ',
                            style: const TextStyle(color: Colors.blue),
                          )
                        ]),
                      )),
                ),

                fixedVerticalSpace(30),
                SizedBox(
                  height: 30,
                  child: Opacity(
                    opacity: start != 0 ? 0.4 : 1,
                    child: MaterialButton(
                        shape: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(smallBorderRadius),
                            borderSide: const BorderSide(color: Colors.blue)),
                        onPressed: start != 0 ? () {} : () {},
                        child: CustomText.boldText('Resend Otp',
                            color: Colors.blue, fontSize: 12)),
                  ),
                ),
                fixedVerticalSpace(30),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(smallBorderRadius),
                        color: Theme.of(context).primaryColor),
                    height: 50,
                    width: s.width * 0.8,
                    child: Center(
                        child: CustomText.boldText('Confirm',
                            color: Colors.white))),
                //   const Spacer(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

//pin put theme, customize for app design.
final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    color: Colors.blueGrey.shade50,
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);

Widget buildPinPut(FocusNode focusNode) {
  return Pinput(
    focusNode: focusNode, autofocus: true,
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: focusedPinTheme,
    submittedPinTheme: submittedPinTheme,
    validator: (s) {
      return null;

      //   return s == '2222' ? null : 'Pin is incorrect';
    },
    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
    showCursor: true,
    // onCompleted: (pin) => print(pin),
  );
}
