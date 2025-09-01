import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsHelper{
  Future<void> saveToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);

  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user.toJson())); //-> Instance of User
  }
  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedJson = prefs.getString("user");
    if(encodedJson == null) return null;
    var json = jsonDecode(encodedJson);
    return User.fromJson(json);
  }
}