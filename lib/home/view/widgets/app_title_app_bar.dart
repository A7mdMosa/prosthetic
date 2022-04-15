import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitleAppBar extends StatelessWidget {
  const AppTitleAppBar({
    required this.title,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.h,
          backgroundColor: Colors.orange.shade900,
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/app-icon.jpg'),
            radius: 10.h,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          'Prosthetic $title',
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
