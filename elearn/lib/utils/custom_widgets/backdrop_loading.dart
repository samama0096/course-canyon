import 'dart:ui';

import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'paddings.dart';

Widget getBackDrop(String msg, double width) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.0,
        sigmaY: 3.0,
      ),
      child: Center(
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(medBorderRadius)),
          child: Padding(
            padding: AppPaddings.mediumPadding,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              CircularProgressIndicator(
                color: errorOrange,
              ),
              fixedHorzSpace(5),
              CustomText.smallText('$msg...', fontSize: 10)
            ]),
          ),
        ), // replace your loading widget
      ),
    );
