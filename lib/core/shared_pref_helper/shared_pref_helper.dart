import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/network/model/response/user/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefHelper {
  Future<void> saveUser(UserResponse user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = user.toJson();
    ///Convert json into string
    prefs.setString("user", jsonEncode(json));

  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<UserResponse?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var encodedJson = prefs.getString("user");
    if(encodedJson == null) return null;
    var json = jsonDecode(encodedJson);
    return UserResponse.fromJson(json);
    ///Convert json into string
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
