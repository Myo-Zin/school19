
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account.dart';


final sharePrefServiceProvider = Provider<SharePrefService>(
      (ref) {
    return SharePrefService();
  },
);
class SharePrefService{
  String isLogin = "isLogin";
  String account = "account";

  Future<bool> setAuthState({required bool value}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool(isLogin, value);
  }

  Future<bool?> getAuthState() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(isLogin);
  }
  Future<bool> setAccount({required Account value}) async{
    final sp = await SharedPreferences.getInstance();

    return sp.setString(account, value.toJson());
  }
  Future<Account?> getAccount() async {
    final sp = await SharedPreferences.getInstance();
    final acc = sp.getString(account);
    if (acc != null) {
      return Account.fromJson(acc);
    } else {
      return null;
    }
  }
  Future<bool> clear() async {
    final sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}