import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearn/interface/controllers/auth/splash_controller.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/paddings.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find();
    Size s = getSize(context);
    return SizedBox(
      height: s.height,
      child: Padding(
        padding: AppPaddings.horizontalSymmetricPadding,
        child: Stack(children: [
          Opacity(
            opacity: 0.7,
            child: Hero(
                tag: 'kid',
                child: Lottie.asset('lib/assets/lotties/kid-laptop.json',
                    repeat: false)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              fixedVerticalSpace(60),
              Container(
                height: 150,
                width: s.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    gradient: LinearGradient(colors: [
                      purplePrimary,
                      purplePrimary.withOpacity(0.8)
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.bodyText(splashController.user.value!.fname,
                            color: Colors.white),
                        CustomText.smallUnderlinedText(
                            splashController.user.value!.email,
                            color: Colors.white),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 45, 193, 193),
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipOval(
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: splashController.user.value!.photoUrl!),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              fixedVerticalSpace(20),
              Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: settings.length,
                      itemBuilder: (context, index) {
                        return getSettingTile(
                            name: settings[index],
                            icon: settingsIcons[index],
                            iconColor: settingsIconColors[index],
                            color: settingsIconColors[index]);
                      }))
            ],
          ),
        ]),
      ),
    );
  }
}

getSettingTile(
        {required String name,
        required IconData icon,
        required Color color,
        required Color iconColor}) =>
    Padding(
      padding: AppPaddings.bottomlargePadding,
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
          size: 20,
        ),
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(medBorderRadius)),
        tileColor: color.withOpacity(0.2),
        title: CustomText.normalText(name, fontSize: 14),
      ),
    );

List<String> settings = [
  'Change password',
  'Payment history',
  'Privacy policy',
  'Delete my account',
  'Logout',
];
List<IconData> settingsIcons = [
  Icons.lock_outline_rounded,
  Icons.paypal_rounded,
  Icons.privacy_tip_rounded,
  Icons.delete_forever,
  Icons.output_rounded
];
List<Color> settingsIconColors = [
  lightOrangesecondary,
  purplePrimary,
  Colors.blue,
  Colors.red,
  errorOrange
];
