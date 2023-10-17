import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPlaceHolder extends StatelessWidget {
  const ErrorPlaceHolder(
      {super.key, required this.h, required this.w, required this.msg});
  final double h;
  final double w;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: Center(
          child: Column(
        children: [
          Lottie.asset('lib/assets/lotties/error.json', repeat: false),
          fixedVerticalSpace(10),
          CustomText.smallText(msg)
        ],
      )),
    );
  }
}

class EmptyPlaceHolder extends StatelessWidget {
  const EmptyPlaceHolder(
      {super.key, required this.h, required this.w, required this.msg});
  final double h;
  final double w;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: Center(
          child: Column(
        children: [
          Lottie.asset('lib/assets/lotties/empty.json', repeat: false),
          fixedVerticalSpace(10),
          CustomText.smallText(msg, fontSize: 10)
        ],
      )),
    );
  }
}
