import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPreferences {
  static const String _keyEmail = 'email_pref';
  static const String _keyPassword = 'password_pref';
  late String email;

//Save email and password.
  static Future<void> savePref(String email, String password) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString(_keyEmail, email);
      pref.setString(_keyPassword, password);
    } catch (e) {
      print(e.toString());
    }
  }

//Get and check the email and password.
  static Future<bool> getPref() async {
    final _auth = FirebaseAuth.instance;
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(_keyEmail) != null) {
      String email = pref.getString(_keyEmail)!;
      String password = pref.getString(_keyPassword)!;
      try {
        //Sign in with email and password.
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        print('signInWithEmailAndPassword');
        return true;
      } catch (e) {
        print(e.toString());
        return false;
      }
    }
    print('Doesn\'t have an account');
    return false;
  }

//Clear the saved data.
  static Future<void> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
