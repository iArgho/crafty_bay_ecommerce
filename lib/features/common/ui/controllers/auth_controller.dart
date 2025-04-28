import 'dart:convert';
import 'package:ecommerce/features/auth/data/models/auth_success_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _accessTokenKey = 'access-token';
  final String _profileDataKey = 'profile-data';

  String? accessToken;
  User? profileModel;

  Future<void> saveUserData(String accessToken, User userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(
        _profileDataKey, jsonEncode(userModel.toJson()));
    this.accessToken = accessToken;
    profileModel = userModel;
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    String? userDataJson = sharedPreferences.getString(_profileDataKey);
    if (userDataJson != null) {
      profileModel = User.fromJson(jsonDecode(userDataJson));
    }
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null && token.isNotEmpty) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    profileModel = null;
  }
}
