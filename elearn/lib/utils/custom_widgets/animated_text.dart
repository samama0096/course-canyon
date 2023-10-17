import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

getAnimatedText(BuildContext context) {
  return AnimatedTextKit(
    repeatForever: true,
    pause: const Duration(seconds: 2),
    animatedTexts: [
      ColorizeAnimatedText(
        'Hi, Welcome back!',
        textStyle: colorizeTextStyle,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.7),
          Colors.black,
        ],
      ),
      ColorizeAnimatedText(
        'Manage your shops.',
        textStyle: colorizeTextStyle,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.7),
          Colors.black,
        ],
      ),
      ColorizeAnimatedText(
        'See store analytics.',
        textStyle: colorizeTextStyle,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.7),
          Colors.black,
        ],
      ),
      ColorizeAnimatedText(
        'Add new products.',
        textStyle: colorizeTextStyle,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.7),
          Colors.black,
        ],
      ),
      ColorizeAnimatedText(
        'Manage your employees.',
        textStyle: colorizeTextStyle,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.7),
          Colors.black,
        ],
      ),
      ColorizeAnimatedText(
        'Create interlinked shops.',
        textStyle: colorizeTextStyle,
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.7),
          Colors.black,
        ],
      ),
    ],
    isRepeatingAnimation: true,
  );
}

var colorizeTextStyle = const TextStyle(
  fontSize: 15.0,
  fontFamily: 'Poppins',
);
