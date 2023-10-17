import 'package:flutter/material.dart';

import 'fixed_constants.dart';
import 'text_cosntants.dart';

//the const. widget used at DashboardView for getting Carousel Cards

getCarouselItem(List<String> txts, String img, bool isDark, {Size? size}) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(medBorderRadius),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(medBorderRadius),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: isDark ? 0.4 : 1,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.boldText(
                      txts[0],
                      fontSize: 26,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    CustomText.boldText(
                      txts[1],
                      fontSize: 26,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    CustomText.boldText(
                      txts[2],
                      fontSize: 26,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
