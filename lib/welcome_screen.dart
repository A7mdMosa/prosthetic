import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login/view/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;

  final welcomeCards = [
    const WelcomeCard(
      image: 'assets/images/welcome_card1.jpg',
      headline: 'Stay updated',
      description:
          'Find the latest Prosthetics news, Research, and related science and technology articles.',
    ),
    const WelcomeCard(
      image: 'assets/images/welcome_card2.jpg',
      headline: 'Explore products',
      description: 'Get all the prosthetic and amputee supplies you need.',
    ),
    const WelcomeCard(
      image: 'assets/images/welcome_card3.png',
      headline: 'Fix it',
      description:
          'Orthotics & Prosthetics Services for fitting, repair and replacement.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 44.h,
                left: 90.w,
                right: 90.w,
              ),
              child: Image.asset(
                'assets/images/splash_image.png',
                fit: BoxFit.contain,
                height: 50.h,
                width: 100.w,
              ),
            ),
            Text(
              'Prosthetic',
              style: TextStyle(
                fontFamily: 'Redressed',
                fontSize: 40.sp,
                color: Colors.orange.shade700,
              ),
            ),
            SizedBox(
                height: 400.h,
                width: 350.w,
                child: PageView.builder(
                    itemCount: welcomeCards.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return welcomeCards[index];
                    })),
            DotsIndicator(
              dotsCount: welcomeCards.length,
              position: currentPage.toDouble(),
              decorator: DotsDecorator(
                spacing: EdgeInsets.symmetric(horizontal: 4.w),
                color: const Color(0xffFCA669),
                size: Size(12.h, 8.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                activeColor: const Color(0xffFC791C),
                activeSize: Size(20.h, 10.w),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            MaterialButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                color: const Color(0xffFC791C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minWidth: 270.w,
                height: 65.h,
                onPressed: () {
                  //Go to Signup screen.
                  Navigator.pushNamed(context, LogInScreen.route,
                      arguments: LogInScreen.signUp);
                }),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have An Account?',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7C7C7C),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //Go to Login screen.
                    Navigator.pushNamed(context, LogInScreen.route,
                        arguments: LogInScreen.logIn);
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffFC791C),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    Key? key,
    required this.image,
    required this.headline,
    required this.description,
  }) : super(key: key);

  final String image;
  final String headline;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          height: 250.h,
          width: 300.w,
        ),
        Text(
          headline,
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}
