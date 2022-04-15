import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'welcome_screen.dart';
import 'home/view/screens/home_screen.dart';
import 'login/shared_preferences/login_shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
    ).then((value) async {
      //Check if the user already has an account.
      await LoginSharedPreferences.getPref()
          ? Navigator.pushReplacementNamed(context, HomeScreen.route)
          : Navigator.pushReplacementNamed(context, WelcomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_image.png',
              fit: BoxFit.contain,
              height: 100.h,
              width: 200.w,
            ),
            Text(
              'Prosthetic',
              style: TextStyle(
                fontFamily: 'Redressed',
                fontSize: 30.sp,
                color: Colors.orange.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
