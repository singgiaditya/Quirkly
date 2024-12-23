import 'package:quirckly/app/core/constant/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSource(this.prefs);

  Future<void> saveToken(String token) async {
    await prefs.setString(tokenPrefsKey, token);
  }

  Future<void> saveUser(String user) async {
    await prefs.setString(userPrefsKey, user);
  }

  Future<String?> getToken() async {
    final token = prefs.getString(tokenPrefsKey);
    return token;
  }

  Future<String?> getUser() async {
    final user = prefs.getString(userPrefsKey);
    return user;
  }

  Future<void> clearCache() async {
    await prefs.remove(tokenPrefsKey);
    await prefs.remove(userPrefsKey);
  }
}
