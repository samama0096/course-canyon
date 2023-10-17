import 'package:elearn/utils/data_constants/localstorage.dart';
import 'package:get/get.dart';
import 'package:elearn/data/localstorage/user_prefs.dart';
import 'package:elearn/data/models/user_model.dart';

//purpose of splash controller is to check user logged in status during splash loading.
class SplashController extends GetxController {
  Rx<NewUser?> user = Rx<NewUser?>(null);
  UserPrefs userPrefs = UserPrefs();

  @override
  void onReady() {
    super.onReady();
    // Checking the login status when the splash screen is ready
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    Future.delayed(const Duration(seconds: 3), () async {
      int isLoggedIn = await userPrefs.checkLoginStatus();
      if (isLoggedIn == 0 || isLoggedIn == 1) {
        //if only logged in, the data will be fetched from prefs
        getUserDataFromLocal();
        // User is logged in, navigate to the homeview
        Get.offAllNamed('/stackedhomeview');
      } else {
        // User is not logged in, navigate to the signin page
        Get.offAllNamed('/loginview');
      }
    });
  }

//load userdata saved in prefs into getx variable to access it inside whole app.
  void getUserDataFromLocal() async {
    user.value = await userPrefs.getUserData();
    print(user.value?.fname);
  }
}
