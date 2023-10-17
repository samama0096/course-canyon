import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/course_model.dart';
import 'fixed_constants.dart';
import 'text_cosntants.dart';
import '../themes/app_theme.dart';

getCourseCard(Size s, Course course, bool isTrending) => SizedBox(
      width: 270,
      child: Card(
        elevation: 3,
        // clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(2),
                topRight: Radius.circular(largelBorderRadius),
                bottomLeft: Radius.circular(largelBorderRadius),
                bottomRight: Radius.circular(largelBorderRadius)),
            borderSide: const BorderSide(color: Colors.blueGrey)),
        //  color: backgroundDullWhite,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: CachedNetworkImage(
                            imageUrl: course.thumnail,
                            fit: BoxFit.contain,
                          )),
                    ),
                    CustomText.boldText(course.title, fontSize: 12),
                    CustomText.smallText('${course.totaltime} hours',
                        fontSize: 10),
                    //    CustomText.smallText('3 hours 20 mins', fontSize: 10),
                    CustomText.boldText('\$ ${course.price}')
                  ],
                ),
                isTrending
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              child: CustomText.smallText('🔥',
                                  color: Colors.white)),
                        ))
                    : const SizedBox(),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: purplePrimary),
                        onPressed: () {},
                        icon: Icon(
                          Icons.school_rounded,
                          color: lightOrangesecondary,
                        ),
                        label: const Text('Enroll')))
              ],
            )),
      ),
    );

getPlaceHolderCard() => SizedBox(
      width: 300,
      child: Card(
        // color: Colors.grey.shade300,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(medBorderRadius),
            borderSide: const BorderSide(color: Colors.blueGrey)),
        //  color: backgroundDullWhite,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(smallBorderRadius)),
                ),
                fixedVerticalSpace(5),
                Container(
                  height: 15,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(5)),
                ),
                fixedVerticalSpace(5),
                Container(
                  height: 15,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(3)),
                ),
                fixedVerticalSpace(5),
              ],
            )),
      ),
    );
