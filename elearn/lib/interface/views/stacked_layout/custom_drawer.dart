import 'package:elearn/data/localstorage/user_prefs.dart';
import 'package:elearn/interface/controllers/auth/splash_controller.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Container(
      height: s.height,
      width: s.width,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.surface,
              ])),
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          fixedVerticalSpace(s.height * 0.2),
          SizedBox(
            height: 60,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                //    mainAxisSize: MainAxisSize.min,
                children: [
                  fixedHorzSpace(10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: splashController.user.value?.type == 1
                          ? Image.network(
                              splashController.user.value!.photoUrl!)
                          : Icon(
                              Icons.person_2_rounded,
                              size: 30,
                              color: purplePrimary,
                            ),
                    ),
                  ),
                  fixedHorzSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.bodyText(
                          '${splashController.user.value?.fname}',
                          color: Colors.white,
                          fontSize: 14),
                      const Text(
                        'View profile ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          fixedVerticalSpace(20),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tabs.length,
                  itemBuilder: (context, i) {
                    return tabs[i];
                  })),
        ]),
      ),
    );
  }
}

List<Widget> tabs = [
  getListTile(
    'Payments',
    Icons.paypal,
    () {},
  ),
  getListTile(
    'Help Center',
    Icons.headset_mic,
    () {},
  ),
  getListTile(
    'Privacy Policy',
    Icons.privacy_tip,
    () {},
  ),
  getListTile(
    'Logout',
    Icons.exit_to_app_rounded,
    () async {
      UserPrefs userPrefs = UserPrefs();
      await userPrefs.removeUserData();
      Get.offAllNamed('/loginview');
    },
  ),
];

getListTile(
  String txt,
  IconData icon,
  Function onTap,
) {
  return Column(
    children: [
      ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: CustomText.smallText(
          txt,
          color: Colors.white,
        ),
        onTap: () => onTap(),
      ),
      const Divider(
        color: Colors.white54,
        endIndent: 100,
      ),
    ],
  );
}
