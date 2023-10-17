import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:elearn/data/models/user_model.dart';
import 'package:elearn/utils/data_constants/localstorage.dart';

class UserPrefs {
  //saves userdata to local when logs in using email signup
  Future<bool> saveUserData(NewUser user) async {
    try {
      final instance = await SharedPreferences.getInstance();
      //encoding user to json to string for saving into prefs.
      final userdata = jsonEncode(NewUser.toJson(user));
      await instance.setString(userprefsname, userdata);
      await instance.setInt(loginstatustype, 0);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveGoogleSigninStatus(NewUser user) async {
    try {
      final instance = await SharedPreferences.getInstance();
      //encoding user to json to string for saving into prefs.
      final userdata = jsonEncode(NewUser.toJson(user));
      await instance.setString(userprefsname, userdata);
      await instance.setInt(loginstatustype, 1);
      return true;
    } catch (e) {
      return false;
    }
  }

//returns saved userdata
  Future<NewUser> getUserData() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final encodedData = instance.getString(userprefsname);

      //decoding the encoded data we saved as string in saveUserData()
      final userdata = NewUser.fromJson(jsonDecode(encodedData!));

      return userdata;
    } catch (e) {
      //returns empty user if data is not present.
      return NewUser(fname: '', email: '', type: 0);
    }
  }

//to check login status (used in splash_controller.dart)
  Future<int> checkLoginStatus() async {
    try {
      int type;
      final instance = await SharedPreferences.getInstance();
      type = instance.getInt(loginstatustype) ?? -1;

      return type;
    } catch (e) {
      return -1;
    }
  }

  Future<void> removeUserData() async {
    // print('removed');
    try {
      final instance = await SharedPreferences.getInstance();
      if (instance.containsKey(loginstatustype)) {
        await instance.remove(loginstatustype);
        await instance.remove(userprefsname);
      }
    } catch (e) {
      // print('e');
    }
  }
}
